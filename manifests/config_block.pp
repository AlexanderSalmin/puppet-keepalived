#=Class keepalived::config_block
define keepalived::config_block (
  String $order,
  Variant[Hash, Array[String]] $opts,
  Enum['present', 'absent'] $ensure = 'present',
  Optional[String] $block_name = undef,
  String $block_id = $name,
) {
  unless defined(Class['keepalived']) {
    fail('You must include the keepalived base class before using any keepalived defined resources')
  }

  $path = "${keepalived::config_dir}/conf.d/${order}-${name}.conf"

  concat {$name:
    ensure  => $ensure,
    group   => 'root',
    mode    => '0644',
    path    => $path,
    owner   => 'root',
    require => File["${keepalived::config_dir}/conf.d"]
  }

  concat::fragment {"${name}_header":
    order   => '01',
    target  => $name,
    content => epp('keepalived/config_block_header.epp', {
      block_id   => $block_id,
      block_name => $block_name,
    })
  }

  concat::fragment {$name:
    order   => '10',
    target  => $name,
    content => epp('keepalived/config_block.epp', {
      opts => $opts
    })
  }

  concat::fragment {"${name}_footer":
    order   => '20',
    target  => $name,
    content => "}\n"
  }

  if $keepalived::service_manage {
    Concat[$name] {
      notify => Service[$keepalived::service_name]
    }
  }
}
