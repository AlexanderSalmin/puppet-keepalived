define keepalived::virtual_server (
  Enum['ip', 'fwmark', 'group'] $type = 'ip',
  Enum['inet', 'inet6'] $ip_family = 'inet',
  Optional[Integer[1]] $delay_loop = undef,
  Optional[Keepalived::Virtual_server::Lvs_schedulers] $lvs_sched = undef,
  Optional[Boolean] $hashed = undef,
  Optional[Boolean] $flag_1 = undef,
  Optional[Boolean] $flag_2 = undef,
  Optional[Boolean] $flag_3 = undef,
  Optional[Boolean] $sh_port = undef,
  Optional[Boolean] $sh_fallback = undef,
  Optional[Boolean] $ops = undef,
  Optional[Keepalived::Virtual_server::Lvs_methods] $lvs_method = undef,
  Optional[String] $persistence_engine = undef,
  Optional[Integer[1]] $persistence_timeout = undef,
  Optional[String] $persistence_granularity = undef,
  Optional[Keepalived::Virtual_server::Protocols] $protocol = undef,
  Optional[Boolean] $ha_suspend = undef,
  Optional[String] $virtualhost = undef,
  Optional[Boolean] $alpha = undef,
  Optional[Boolean] $omega = undef,
  Optional[Integer[1]] $quorum = undef,
  Optional[Integer[0]] $hysteresis = undef,
  Optional[String] $quorum_up = undef,
  Optional[String] $quorum_down = undef,
  Optional[String] $sorry_server = undef,
  Optional[Boolean] $sorry_server_inhibit = undef,
  Optional[Keepalived::Virtual_server::Lvs_methods] $sorry_server_lvs_method = undef,
  Keepalived::Virtual_server::Real_servers $real_servers = {},
  Enum["present", "absent"] $ensure = "present"
) {
  unless defined(Class["keepalived"]) {
    fail("You must include the keepalived base class before using any keepalived defined resources")
  }

  $block_type = $type ? {
    'ip' => '',
    default => " ${type}"
  }

  keepalived::config_block {"virtual_server_${name}":
    order => "30",
    block_id => "virtual_server${block_type}",
    block_name => $name,
    opts => {
      "ip_family" => $ip_family,
      "delay_loop" => $delay_loop,
      "lvs_sched" => $lvs_sched,
      "hashed" => $hashed,
      "flag-1" => $flag_1,
      "flag-2" => $flag_2,
      "flag-3" => $flag_3,
      "sh-port" => $sh_port,
      "sh-fallback" => $sh_fallback,
      "ops" => $ops,
      "lvs_method" => $lvs_method,
      "persistence_engine" => $persistence_engine,
      "persistence_timeout" => $persistence_timeout,
      "persistence_granularity" => $persistence_granularity,
      "protocol" => $protocol,
      "ha_suspend" => $ha_suspend,
      "virtualhost" => $virtualhost,
      "alpha" => $alpha,
      "omega" => $omega,
      "quorum" => $quorum,
      "hysteresis" => $hysteresis,
      "quorum_up" => $quorum_up,
      "quorum_down" => $quorum_down,
      "sorry_server" => $sorry_server,
      "sorry_server_inhibit" => $sorry_server_inhibit,
      "sorry_server_lvs_method" => $sorry_server_lvs_method
    }
  }

  $real_servers.each |String $server_name, Keepalived::Virtual_server::Real_server $server| {
    keepalived::real_server {$server_name:
      * => $server,
      virtual_server => $name
    }
  }

  # realize exported real servers
  Keepalived::Real_server <<| virtual_server == $name |>>
}
