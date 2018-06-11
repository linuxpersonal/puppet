class nagios::client (
  $ipaddress = $::ipaddress,
){

  case $facts['osfamily'] {
    'RedHat': {
      $clientpkgs = [ 'nrpe', 'nagios-plugins-all' ]
      $nrpe_conf  = 'redhat.erb'
      $pluginlo   = '/usr/lib64/nagios/plugins/check_mem'
      $nrpepkg  = 'nrpe'
    }
    
    'Debian': {
      $clientpkgs = [ 'nagios-nrpe-server', 'nagios-nrpe-plugin', 'nagios-plugins-basic' ]
      $nrpe_conf  = 'debian.erb'
      $pluginlo   = '/usr/lib/nagios/plugins/check_mem'
      $nrpepkg  = 'nagios-nrpe-server'
    }

    default: { notify {"OS not supported": } }
  
  }

  package { $clientpkgs: 
    ensure =>  present,
  }

  file { '/etc/nagios/nrpe.cfg': 
    ensure  => present,
    notify  => Service[$nrpepkg],
    content => template("nagios/nrpe/${nrpe_conf}"),
    require => Package[$nrpepkg],
    }          

  file { $pluginlo:
    ensure => present,
    mode   => '655',
    source => 'puppet:///modules/nagios/plugins/check_mem',
  }

  include nagios::service

}
