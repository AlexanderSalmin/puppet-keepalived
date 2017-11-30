#=Class keepalived::vrrp_sync_group
define keepalived::vrrp_sync_group (
  Array[String] $group,
  Optional[String] $notify_master = undef,
  Optional[String] $notify_backup = undef,
  Optional[String] $notify_fault = undef,
  Optional[String] $notify_all = undef,
  Optional[Boolean] $smtp_alert = undef,
  Enum['present', 'absent'] $ensure = 'present'
) {
  keepalived::config_block {"vrrp_sync_group_${name}":
    ensure     => $ensure,
    block_id   => 'vrrp_sync_group',
    block_name => $name,
    opts       => {
      'group'         => $group,
      'notify_master' => $notify_master,
      'notify_backup' => $notify_backup,
      'notify_fault'  => $notify_fault,
      'notify'        => $notify_all,
      'smtp_alert'    => $smtp_alert
    },
    order      => '15',
    require    => Keepalived::Vrrp_instance[$group]
  }
}
