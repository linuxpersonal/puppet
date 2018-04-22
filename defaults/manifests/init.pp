class defaults {

  include defaults::params
  include defaults::packages
  include defaults::services
  include defaults::sshkeys
  
  defaults::yumconf { "proxy":
    squidproxy => true
  }
  
  case $::osfamily {
    'Redhat': {
      include sshservice::config      
      include servicetype::type
      unless $::fqdn == 'nagios.skull.local' {
        include nagios::client
      }
    }
    'Debian': {
      unless $::fqdn == 'nagios.skull.local' {
        include nagios::client
      }
    }   
  }   
}
