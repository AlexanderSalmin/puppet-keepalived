class keepalived (
  Keepalived::Options $opts,
  Keepalived::Globaldefs_options $globaldefs_opts,
  Array[String] $static_ipaddress,
  Array[String] $static_routes,
  Array[String] $static_rules,
  Keepalived::Vrrp::Scripts $vrrp_scripts,
  Keepalived::Vrrp::Sync_groups $vrrp_sync_groups,
  Keepalived::Garp::Groups $garp_groups,
  Keepalived::Vrrp::Instances $vrrp_instances,
  Keepalived::Virtual_servers $virtual_servers,
  String $config_file,
  Boolean $config_file_manage,
  String $config_dir,
  Boolean $config_dir_purge,
  Hash $packages,
  String $service_name,
  Boolean $service_manage,
  Enum["stopped", "running"] $service_ensure,
  Boolean $service_enable
) {
  include keepalived::install
  include keepalived::config
  include keepalived::service

  keepalived::config_block {
    "global_defs":
      order => "00",
      opts => $globaldefs_opts;

    "static_ipaddress":
      order => "05",
      opts => $static_ipaddress;

    "static_routes":
      order => "05",
      opts => $static_routes;

    "static_rules":
      order => "05",
      opts => $static_rules;
  }

  $vrrp_scripts.each |String $script_name, Keepalived::Vrrp::Script $script| {
    keepalived::vrrp_script {$script_name:
      * => $script
    }
  }

  $vrrp_sync_groups.each |String $sync_group_name, Keepalived::Vrrp::Sync_group $sync_group| {
    keepalived::vrrp_sync_group {$sync_group_name:
      * => $sync_group
    }
  }

  $garp_groups.each |String $garp_group_name, Keepalived::Garp::Group $garp_group| {
    keepalived::garp_group {$garp_group_name:
      * => $garp_group
    }
  }

  $vrrp_instances.each |String $instance_name, Keepalived::Vrrp::Instance $instance| {
    keepalived::vrrp_instance {$instance_name:
      * => $instance
    }
  }

  $virtual_servers.each |String $server_name, Keepalived::Virtual_server_spec $server| {
    keepalived::virtual_server {$server_name:
      * => $server
    }
  }
}
