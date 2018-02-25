class nagios::service {

  case $facts['osfamily'] {
    'RedHat': { $nrpepkg = "nrpe" } 
    'Debian': { $nrpepkg = "nagios-nrpe-server" }
  }

    if $::hostname == "nagios" {
      service { 'nagios':
        enable  => true,
        ensure  => running,
      }
    }
  
    unless $::hostname == "nagios" {
      service { $nrpepkg:
        enable  => true,
        ensure  => running,
        require => Package[$nrpepkg],
    }
  }

}
