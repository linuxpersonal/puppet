class nagios::server (
  $basepkgs = [ 'gcc', 'glibc', 'glibc-common', 'gd', 'gd-devel', 'make', 'net-snmp', 'openssl-devel', 'xinetd', 'unzip'],
  $nagiospkgs = [ 'nagios-common', 'nagios-plugins-all','nagios-plugins-nrpe' ]
){

  package { 
    $basepkgs:
    ensure => present;
    $nagiospkgs:
    ensure => present;
  }

  file {
    "/usr/local/nagios/etc/objects/commands.cfg":
      ensure => present,
      source => 'puppet:///modules/nagios/config/commands.cfg';
    "/usr/local/nagios/etc/objects/templates.cfg":
      ensure => present,
      source => 'puppet:///modules/nagios/config/templates.cfg';
    "/usr/lib64/nagios/plugins":
      ensure => link,
      target => "/usr/local/nagios/libexec",
    "/usr/local/nagios/etc/nagios.cfg":
      ensure => present,
      source => 'puppet:///modules/nagios/config/nagios.cfg';
  }

}
