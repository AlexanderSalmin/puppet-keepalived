define keepalived::virtual_server (
  Optional[Enum['ip', 'fwmark', 'group']] $type = 'ip',
  Optional[Enum['inet', 'inet6']] $ip_family = 'inet',
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
  Array[Keepalived::Virtual_server::Real_server] $real_server = [],
  Enum["present", "absent"] $ensure = "present"
) {
  #keepalived::block {"_${name}":
  #  order => "10",
  #  block_id => "vrrp_instance",
  #  block_name => $name,
  #  opts => {
  #  },
  #  ensure => $ensure
  #}

  ## realize exported real servers
  #Keepalived::Real_server <<| virtual_server == $name |>>
}
