class defaults::packages (
  $def_packages = $::defaults::params::def_packages,
  $removal = undef,
) {
  package { $def_packages:
    ensure  => present,
  }

  if $removal {
    package { $removal:
      ensure => absent,
    }
  }
}
