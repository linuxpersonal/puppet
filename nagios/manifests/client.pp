class nagios::client (
  $clientpkgs = [ 'nrpe', 'nagios-plugins-all' ],
  $ipaddress = $::ipaddress,
  $root = hiera('nagios::root'),
){
 
  include nagios::service

  package { $clientpkgs: 
    ensure =>  present,
  }

  file { '/etc/nagios/nrpe.cfg': 
    ensure  => present,
    content => template('nagios/nrpe.erb'),
    notify  => Package['nrpe'],
    }          

  file { '/usr/lib64/nagios/plugins/check_mem':
    ensure => present,
    mode   => '655',
    source => 'puppet:///modules/nagios/plugins/check_mem',
  }
}
