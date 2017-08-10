type Keepalived::Virtual_server::Real_server::Dns_check = Struct[{
  Optional[connect_ip] => String,
  Optional[connect_port] => Integer[1, 65535],
  Optional[bindto] => String,
  Optional[bind_port] => Integer[1, 65535],
  Optional[connect_timeout] => Integer[1],
  Optional[fwmark] => Integer,
  Optional[retry] => Integer[1],
  Optional["type"] => String,
  Optional[name] => String
}]
