define nagios::clients::add (
  $hostname = $name,
  $ipaddress,
){
  file { "/etc/nagios/servers/${hostname}.cfg":
    ensure  => present,
    content => template('nagios/host.erb'),
    notify  => Service['nagios'],
  }
  include nagios::service
}
