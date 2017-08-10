type Keepalived::Options = Struct[{
  Optional[net_namespace] => String,
  Optional[namespace_with_ipsets] => Boolean,
  Optional[instance] => String,
  Optional[use_pid_dir] => Boolean,
  Optional[linkbeat_use_polling] => Boolean
}]
