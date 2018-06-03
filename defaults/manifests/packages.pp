class defaults::packages (
  $def_packages = $::defaults::params::def_packages,
  $removal = [ 'zabbix-agent', 'zabbix-release' ],
) {
  package { $def_packages:
    ensure  => present,
  }
  package { $removal:
    ensure => absent,
  }
}
