class keepalived::config {
  file {[$keepalived::config_dir, "${keepalived::config_dir}/conf.d"]:
    owner => "root",
    group => "root",
    mode => "0755",
    ensure => "directory",
    recurse => true,
    purge => $keepalived::config_dir_purge
  }

  if $keepalived::config_file_manage {
    file {$keepalived::config_file:
      owner => "root",
      group => "root",
      mode => "0644",
      content => epp("keepalived/keepalived.conf.epp", {"opts" => $keepalived::opts})
    }
  }

  if $keepalived::service_manage {
    File[$keepalived::config_dir] {
      notify => Service[$keepalived::service_name]
    }

    if $keepalived::config_file_manage {
      File[$keepalived::config_file] {
        notify => Service[$keepalived::service_name]
      }
    }
  }
}
