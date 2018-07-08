define defaults::yumconf (
$squidproxy = undef,
$squidip    = hiera('squid::squidip'),
$squidport  = hiera('squid::squidport'),
$repo       = hiera('repo::repo'),
){
  file { "/etc/yum.conf":
    content => template('defaults/yum.conf.erb'),
    ensure  => present;
  "/etc/yum.repos.d/CentOS-Base.repo":
    content => template('defaults/centosbase.repo.erb'),
    ensure  => present;
  "/etc/yum.repos.d/epel.repo":
    content => template('defaults/epel.repo.erb'),
    ensure  => present;
  }
}
