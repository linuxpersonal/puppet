class nagios::service {

    if $::hostname == "nagios" {
      service { 'nagios':
        enable  => true,
        ensure  => running,
        require => Package['nagios'],
      }
    }
  
    unless $::hostname == "nagios" {
      service { 'nrpe':
        enable  => true,
        ensure  => running,
        require => Package['nrpe'],
    }
  }
}
