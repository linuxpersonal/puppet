class nagios::client (
  $users_w      = hiera(nagios::users_w,5),
  $users_c      = hiera(nagios::users_c,10),
  $load_w       = hiera(nagios::load_w,'15,10,5'),
  $load_c       = hiera(nagios::load_c,'30,25,20'),
  $diskroot_w   = hiera(nagios::diskroot_w,'20%'),
  $diskroot_c   = hiera(nagios::diskroot_c,'10%'),
  $swap_w       = hiera(nagios::swap_w,'20%'),
  $swap_c       = hiera(nagios::swap_c,'10%'),
  $mem_w        = hiera(nagios::mem_w,'2.5'),
  $mem_c        = hiera(nagios::mem_c,'1.5'),
  $procs_w      = hiera(nagios::procs_w,200),
  $procs_c      = hiera(nagios::procs_c,250),
  $ipaddress    = hiera(nagios::ipaddress,$::ipaddress),
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
