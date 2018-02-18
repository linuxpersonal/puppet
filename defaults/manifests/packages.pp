class defaults::packages (
  $def_packages = $::defaults::params::def_packages,
) {
    package { $def_packages:
     ensure  => present,
  }
}
