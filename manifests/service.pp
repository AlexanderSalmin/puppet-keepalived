#=Class keepalived::service
class keepalived::service {
  if $keepalived::service_manage {
    service {$keepalived::service_name:
      ensure    => $keepalived::service_ensure,
      enable    => $keepalived::service_enable,
      subscribe => Package[keys($keepalived::packages)]
    }
  }
}
