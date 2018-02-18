class squid::server (
  $ipaddress  = hiera('squid::ipaddress'),
  $hostname   = hiera('squid::hostname'),
  $customip   = hiera('squid::customip'),
  $cachesize  = hiera('squid::cachesize'),
  $portnumber = hiera('squid::portnumber'),
) {
  
  package { 'squid': 
    ensure  => present,
  }

  file { '/etc/squid/squid.conf':
    notify  => Service['squid'],
    ensure  => present,
    content => template('squid/squid.conf.erb'),
  }

  service { 'squid':
    ensure  => running,
    enable  => true,
    require => Package['squid'],
  }
}
