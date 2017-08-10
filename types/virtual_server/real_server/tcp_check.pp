type Keepalived::Virtual_server::Real_server::Tcp_check = Struct[{
  connect_ip => String,
  connect_port => Integer[1, 65535],
  Optional[bindto] => String,
  Optional[bind_port] => Integer[1, 65535],
  Optional[connect_timeout] => Integer[1],
  Optional[fwmark] => Integer,
  Optional[warmup] => Integer[1]
}]
