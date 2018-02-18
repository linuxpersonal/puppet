class localusers {
  class { 'localusers::groups::admin': } ->
  class { 'localusers::groups::wheel': } 
  user { 'admin': 
    ensure     => present,
    shell      => '/bin/bash',
    home       => '/home/admin',
    gid        => 'wheel',
    managehome => true,
    password   => '$6$D.otbljf$HmcYomomXt62ZWg19P/3wQNnKjAicfl4syhxpLTLOULvMXsNuLBu1jfqqSnItcxAiyv7znNHkL.jb3RWteP2y0'
	}
  user { 'doc':
    ensure     => present,
    shell      => '/bin/bash',
    home       => '/home/doc',
    groups     => ['wheel', 'admin'],
    managehome => true,
	}
  user { 'ansible':
      ensure     => present,
      shell      => '/bin/bash',
      home       => '/home/ansible',
      groups     => ['wheel', 'admin'],
      managehome => true,
      password   => '$1$ndKyf63P$NFWBThhGNPqVYC71DEwho0',
  }
}
