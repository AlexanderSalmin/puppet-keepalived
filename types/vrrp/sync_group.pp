type Keepalived::Vrrp::Sync_group = Struct[{
  group => Array[String],
  Optional[notify_master] => String,
  Optional[notify_backup] => String,
  Optional[notify_fault] => String,
  Optional["notify"] => String,
  Optional[smtp_alert] => Boolean,
  Optional[ensure] => Enum["present", "absent"]
}]
