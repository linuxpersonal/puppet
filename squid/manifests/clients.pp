class squid::clients (
  $squidproxy = '10.1.1.210:3128',
) {
  file {'/etc/yum.conf':
    ensure  => present,
    content => template('squid/yum.conf.erb'),
  }
}

