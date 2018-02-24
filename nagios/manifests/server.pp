class nagios::server (
  $basepkgs = [ 'gcc', 'glibc', 'glibc-common', 'gd', 'gd-devel', 'make', 'net-snmp', 'openssl-devel', 'xinetd', 'unzip'],
  $nagiospkgs = [ 'nagios', 'nagios-common', 'nagios-plugins-all','nagios-plugins-nrpe' ]
){

  package { $basepkgs:
    ensure => present,
  }
  package { $nagiospkgs:
    ensure => present,
  }

}
