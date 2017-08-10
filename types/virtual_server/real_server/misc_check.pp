type Keepalived::Virtual_server::Real_server::Misc_check = Struct[{
  Optional[misc_path] => String,
  Optional[misc_timeout] => Integer[1],
  Optional[warmup] => Integer[1],
  Optional[misc_dynamic] => Boolean,
  Optional[user] => String
}]
