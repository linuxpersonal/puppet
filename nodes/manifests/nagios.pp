class nodes::nagios {

  include defaults
  include apache
  include nagios

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
  }
}
