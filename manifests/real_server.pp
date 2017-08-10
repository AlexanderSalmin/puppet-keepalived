define keepalived::real_server (
  String $server_name = $name,
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
  Optional[Keepalived::Virtual_server::Real_server::Misc_check] $misc_check = undef
) {
  concat::fragment {$name:
    order => "20",
    target => "virtual_server_${virtual_server}",
    content => epp("keepalived/config_block.epp", {
      opts => {
        "real_server ${server_name}" => {
          weight => $weight,
          lvs_method => $lvs_method,
          inhibit_on_failure => $inhibit_on_failure,
          notify_up => $notify_up,
          notify_down => $notify_down,
          http_check => $http_check,
          ssl_check => $ssl_check,
          tcp_check => $tcp_check,
          smtp_check => $smtp_check,
          dns_check => $dns_check,
          misc_check => $misc_check
        }
      }
    })
  }
}
