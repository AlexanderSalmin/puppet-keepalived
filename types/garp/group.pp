type Keepalived::Garp::Group = Struct[{
  Optional[garp_interval] => Integer[1],
  Optional[gna_interval] => Integer[1],
  Optional[interface] => String,
  Optional[interfaces] => Array[String],
  Optional[ensure] => Enum["present", "absent"]
}]
