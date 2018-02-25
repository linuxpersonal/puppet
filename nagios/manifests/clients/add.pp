define nagios::clients::add (
  $hostname = $name,
  $source = undef,
  $ipaddress,
){

  if $source {

    file { "/etc/nagios/servers/${hostname}.cfg":
      ensure  => present,
      content => template("nagios/hosttype/${source}.erb"),
      notify  => Service['nagios'],
    }

  } else {

    file { "/etc/nagios/servers/${hostname}.cfg":
      ensure  => present,
      content => template('nagios/hosttype/default.erb'),
      notify  => Service['nagios'],
    }

  }
  include nagios::service
}
