class nodes::nagios {

  include defaults
  include apache
  include nagios::server

  nagios::clients::add { 
    'puppet.skull.local':
      ipaddress => "10.1.1.208";
    'management.skull.local':
      ipaddress => "10.1.1.102";
    'ansible.skull.local':
      ipaddress => "10.1.1.241";
    'ddns.skull.local':
      ipaddress => "10.1.1.60"; 
    'slaveddns.skull.local':
      ipaddress => "10.1.1.61"; 
    'kvm.skull.local':
      ipaddress => "10.1.1.101"; 
    'squid.skull.local':
      ipaddress => "10.1.1.210"; 
    'nginx.skull.local':
      ipaddress => "10.1.1.202"; 
    'sickrage.skull.local':
      ipaddress => "10.1.1.215"; 
    'cloud.linuxpersonal.com':
      source    => "webserver",
      ipaddress => "108.61.96.41"; 
    'linuxpersonal.com':
      source    => "webnoswap",
      ipaddress => "45.32.242.149"; 
  }
}
