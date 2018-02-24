class defaults {

  include defaults::params
  include defaults::packages
  include defaults::services
  include defaults::sshkeys
  
  case $::osfamily {
    'Redhat': {
      include sshservice::config
      include squid::clients      
      include servicetype::type
      unless $::fqdn == 'nagios.skull.local' {
        include nagios::client
      }
    }
      'Debian': {       
      }   
  }   
}
