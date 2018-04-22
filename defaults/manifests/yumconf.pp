define defaults::yumconf (
$squidproxy = undef,
$squidip    = hiera('squid::squidip'),
$squidport  = hiera('squid::squidport')
){
  case $::osfamily {
    'Redhat': {
      file { "/etc/yum.conf":
        content => template('defaults/yum.conf.erb'),
        ensure  => present,
      }
    }
    'Debian': {
    }   
  }   
}
