define keepalived::block (
  String $order,
  String $block_id = $name,
  Optional[String] $block_name = undef,
  Variant[Hash, Array[String]] $opts,
  Enum["present", "absent"] $ensure = "present"
) {
  unless defined(Class["keepalived"]) {
    fail("You must include the keepalived base class before using any keepalived defined resources")
  }

  file {"${keepalived::config_dir}/conf.d/${order}-${name}.conf":
    owner => "root",
    group => "root",
    mode => "0644",
    content => epp("keepalived/block.conf.epp", {
      block_id => $block_id,
      block_name => $block_name,
      opts => $opts
    }),
    ensure => $ensure
  }

  if $keepalived::service_manage {
    File["${keepalived::config_dir}/conf.d/${order}-${name}.conf"] {
      notify => Service[$keepalived::service_name]
    }
  }
}
