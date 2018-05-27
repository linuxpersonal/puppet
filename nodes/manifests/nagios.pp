class nodes::nagios {

  include defaults
  include apache
  include nagios::server

  nagios::clients::add { 
    'puppet.skull.local':
      ipaddress => "10.1.1.208";
    'white.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.2";
    'red.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.3";
    'blue.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.4";
    'ansible.skull.local':
      ipaddress => "10.1.1.241";
    'ddns.skull.local':
      ipaddress => "10.1.1.60"; 
    'kvm.skull.local':
      ipaddress => "10.1.1.101"; 
    'squid.skull.local':
      ipaddress => "10.1.1.210"; 
    'sickrage.skull.local':
      ipaddress => "10.1.1.215"; 
    'nasdocker.skull.local':
      ipaddress => "10.1.1.240"; 
    'cloud.linuxpersonal.com':
      source    => "webserver",
      ipaddress => "108.61.96.41"; 
    'linuxpersonal.com':
      source    => "webnoswap",
      ipaddress => "45.32.242.149"; 
  }
}
