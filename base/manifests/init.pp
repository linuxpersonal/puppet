class base {

	$dnsutil = $osfamily ? {
	'RedHat' => 'bind-utils',
	'Debian' => 'bind9utils',
	 default => 'bind-utils',
	}
	
	$systemupdate = $osfamily ? {
	'RedHat' => '/usr/bin/yum update -y',
	'Debian' => '/usr/bin/apt-get upgrade -y',
	}

	package { ['tree',"$dnsutil",'links','nethogs','net-tools']:
		ensure => present,
	}
	
	schedule { 'system-daily':
	period => daily,
	range  => '00:00 - 01:00',
	}
	
	exec { $systemupdate: 
		schedule => 'system-daily',
	}
}
