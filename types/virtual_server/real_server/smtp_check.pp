type Keepalived::Virtual_server::Real_server::Smtp_check = Struct[{
  Optional[connect_ip] => String,
  Optional[connect_port] => Integer[1, 65535],
  Optional[bindto] => String,
  Optional[bind_port] => Integer[1, 65535],
  Optional[connect_timeout] => Integer[1],
  Optional[fwmark] => Integer,
  Optional[host] => Array[
    Struct[{
      connect_ip => String,
      connect_port => Integer[1, 65535],
      Optional[bindto] => String,
      Optional[bind_port] => Integer[1, 65535],
      Optional[connect_timeout] => Integer[1],
      Optional[fwmark] => Integer,
    }]
  ],
  Optional[retry] => Integer[1],
  Optional[helo_name] => String,
  Optional[delay_before_retry] => Integer[1],
  Optional[warmup] => Integer[1]
}]
