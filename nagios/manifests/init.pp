class nagios {

  include nagios::server
  include nagios::users
  include nagios::service

}
