type Keepalived::Virtual_server::Real_server = Struct[{
  Optional[virtual_server] => String,
  Optional[weight] => Integer[1],
  Optional[lvs_method] => Enum['NAT', 'DR', 'TUN'],
  Optional[inhibit_on_failure] => Boolean,
  Optional[notify_up] => String,
  Optional[notify_down] => String,
  Optional["HTTP_GET"] => Keepalived::Virtual_server::Real_server::Http_check,
  Optional["SSL_GET"] => Keepalived::Virtual_server::Real_server::Http_check,
  Optional["TCP_CHECK"] => Keepalived::Virtual_server::Real_server::Tcp_check,
  Optional["SMTP_CHECK"] => Keepalived::Virtual_server::Real_server::Smtp_check,
  Optional["DNS_CHECK"] => Keepalived::Virtual_server::Real_server::Dns_check,
  Optional["MISC_CHECK"] => Keepalived::Virtual_server::Real_server::Misc_check,
  Optional[ensure] => Enum["present", "absent"]
}]
