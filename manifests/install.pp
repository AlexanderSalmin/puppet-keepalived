class keepalived::install {
  $keepalived::packages.each |String $package_name, Hash $package| {
    package {$package_name:
      * => $package
    }
  }
}
