define keepalived::garp_group (
  Optional[Integer[1]] $garp_interval = undef,
  Optional[Integer[1]] $gna_interval = undef,
  Optional[String] $interface = undef,
  Optional[Array[String]] $interfaces = undef,
  Enum["present", "absent"] $ensure = "present"
) {
  if $interface and $interfaces {
    fail("Only one of interface or interfaces should be used in ${title}")
  }

  keepalived::config_block {"garp_group_${name}":
    order => "20",
    block_id => "garp_group",
    opts => {
      garp_interval => $garp_interval,
      gna_interval => $gna_interval,
      interface => $interface,
      interfaces => $interfaces
    },
    ensure => $ensure
  }
}
