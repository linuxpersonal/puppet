class defaults {

  include defaults::params
  include defaults::packages
  include defaults::services
  include defaults::sshkeys
  
  unless $::fqdn == 'nagios.skull.local' {
    include nagios::client
  }

  case $::osfamily {
    'Redhat': {
      include sshservice::config      
      include servicetype::type
      include defaults::yumconf
    }
    'Debian': {
    }   
  }   
}
