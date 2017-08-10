type Keepalived::Virtual_server::Real_server::Http_check = Struct[{
  url => Array[
    Struct[{
      path => String,
      digest => String,
      Optional[status_code] => Integer
    }]
  ],
  Optional[connect_ip] => String,
  Optional[connect_port] => Integer[1, 65535],
  Optional[bindto] => String,
  Optional[bind_port] => Integer[1, 65535],
  Optional[connect_timeout] => Integer[1],
  Optional[fwmark] => Integer,
  Optional[nb_get_retry] => Integer[1],
  Optional[delay_before_retry] => Integer[1],
  Optional[warmup] => Integer[1]
}]
