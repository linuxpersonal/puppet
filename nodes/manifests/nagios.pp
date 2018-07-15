class nodes::nagios {

  nagios::clients::add { 
    ## Dockers
    'red.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.2";
    'white.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.3";
    'blue.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.4";
    'magento.skull.local':
      source    => "docker",
      ipaddress => "10.1.1.6";
    ## VMs
    'ansible.skull.local':
      ipaddress => "10.1.1.241";
    'ddns.skull.local':
      ipaddress => "10.1.1.60"; 
    'kvm.skull.local':
      ipaddress => "10.1.1.101"; 
    'puppet.skull.local':
      ipaddress => "10.1.1.208";
    'squid.skull.local':
      ipaddress => "10.1.1.210"; 
    'sickrage.skull.local':
      ipaddress => "10.1.1.215"; 
    'nasdocker.skull.local':
      ipaddress => "10.1.1.240"; 
    'dockers.skull.local':
      ipaddress => "10.1.1.244"; 
    'cloud.linuxpersonal.com':
      source    => "webserver",
      ipaddress => "108.61.96.41"; 
    'linuxpersonal.com':
      source    => "webnoswap",
      ipaddress => "45.32.242.149"; 
  }
  apache::vhosts { 'nagios': 
    domains => 'nagios.skull.local',
    source  => true,
  }
}
