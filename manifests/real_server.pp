define keepalived::real_server (
  String $virtual_server,
  Optional[Integer[1]] $weight = undef,
  Optional[Keepalived::Virtual_server::Lvs_methods] $lvs_method = undef,
  Optional[Boolean] $inhibit_on_failure = undef,
  Optional[String] $notify_up = undef,
  Optional[String] $notify_down = undef,
  Optional[Keepalived::Virtual_server::Real_server::Http_check] $http_check = undef,
  Optional[Keepalived::Virtual_server::Real_server::Http_check] $ssl_check = undef,
  Optional[Keepalived::Virtual_server::Real_server::Tcp_check] $tcp_check = undef,
  Optional[Keepalived::Virtual_server::Real_server::Smtp_check] $smtp_check = undef,
  Optional[Keepalived::Virtual_server::Real_server::Dns_check] $dns_check = undef,
  Optional[Keepalived::Virtual_server::Real_server::Misc_check] $misc_check = undef,
  Enum["present", "absent"] $ensure = "present"
) {
}
