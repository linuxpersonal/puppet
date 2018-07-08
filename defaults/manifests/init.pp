class defaults {

  include defaults::params
  include defaults::packages
  include defaults::services
  include defaults::sshkeys
  
  
  case $::osfamily {
    'Redhat': {
      include sshservice::config      
      include servicetype::type
      defaults::yumconf { "proxy": squidproxy => true }
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
