define keepalived::vrrp_sync_group (
  Array[String] $group,
  Optional[String] $notify_master = undef,
  Optional[String] $notify_backup = undef,
  Optional[String] $notify_fault = undef,
  Optional[String] $notify = undef,
  Optional[Boolean] $smtp_alert = undef,
  Enum["present", "absent"] $ensure = "present"
) {
  keepalived::block {"vrrp_sync_group_${name}":
    order => "15",
    block_id => "vrrp_sync_group",
    block_name => $name,
    opts => {
      "group" => $group,
      "notify_master" => $notify_master,
      "notify_backup" => $notify_backup,
      "notify_fault" => $notify_fault,
      "notify" => $notify,
      "smtp_alert" => $smtp_alert
    },
    ensure => $ensure
  }
}
