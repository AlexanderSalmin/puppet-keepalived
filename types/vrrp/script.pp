type Keepalived::Vrrp::Script = Struct[{
  script => String,
  Optional[interval] => Integer[1],
  Optional[timeout] => Integer[1],
  Optional[weight] => Integer[-254, 254],
  Optional[fall] => Integer[1],
  Optional[rise] => Integer[1],
  Optional[user] => String,
  Optional[init_fail] => Boolean,
  Optional[ensure] => Enum['present', 'absent']
}]
