class nagios::password {

  file { '/etc/nagios/htpasswd':
    ensure  => present,
    content => 'nagiosadmin:$apr1$uoY3hBxy$eSqR242z1FMJyLVyDm3uF/'
  }

}
