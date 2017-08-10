define keepalived::vrrp_script (
  String $script,
  Optional[Integer[1]] $interval = undef,
  Optional[Integer[1]] $timeout = undef,
  Optional[Integer[-254, 254]] $weight = undef,
  Optional[Integer[1]] $fall = undef,
  Optional[Integer[1]] $rise = undef,
  Optional[String] $user = undef,
  Optional[Boolean] $init_fail = Boolean,
  Enum["present", "absent"] $ensure = "present"
) {
  keepalived::config_block {"vrrp_script_${name}":
    order => "10",
    block_id => "vrrp_script",
    block_name => $name,
    opts => {
      script => $script,
      interval => $interval,
      timeout => $timeout,
      weight => $weight,
      fall => $fall,
      rise => $rise,
      user => $user,
      init_fail => $init_fail
    },
    ensure => $ensure
  }
}
