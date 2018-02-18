class zabbix::server(
  $ipaddress   = hiera('zabbix::serverip'),
  $packages    = hiera('zabbix::serverpkgs'),
  $timezone    = hiera('zabbix::timezone'),
  $zabbixdb    = hiera('zabbix::db'),
  $zabbixuser  = hiera('zabbix::user'),
  $mysqlpass   = hiera('zabbix::mysqlpass'),
  $pkgname     = hiera('zabbix::pkgname'),
  $pkgsource   = hiera('zabbix::pkgsource'),
  $hostname    =  "${::fqdn}",
  $createsfile = '/etc/zabbix/.mysqlsetup'
) {
  
  package { $pkgname:
    provider => 'rpm',
    source   => $pkgsource,
    ensure   => present, 
  }
  
  package { $packages: 
    ensure  => present,
    require => Package[$pkgname]
  }

  file { '/etc/httpd/conf.d/zabbix.conf':
    notify  => Service['zabbix-server'],
    ensure  => present,
    content => template('zabbix/zabbix.conf.erb'),
  }

  file { '/root/.my.cnf':
    ensure  => present,
    content => template('zabbix/my.cnf.erb'),
  }

  file { '/etc/zabbix/mysqlsetup.sh':
    ensure  => present,
    content => template('zabbix/zabbixmysql.erb'),
    mode    => '0755',
  }

  exec { 'Run Mysql Setup':
    command => '/usr/bin/bash /etc/zabbix/mysqlsetup.sh',
    creates => $createsfile,
  }

  file { '/etc/zabbix/.mysqlsetup':
    ensure  => present,
    content => 'Managed by Puppet do not remove'
  }

  service { 'zabbix-server':
    ensure  => running,
    enable  => true,
    require => Package[$pkgname],
  }

  notify { 'variable test':
    name     => "Variable test",
    message => "Variable test for ${ipaddress}",
  }

}
