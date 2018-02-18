class base::ssh inherits base::params {

	package { 'openssh-package':
		name    => 'openssh-server',
		ensure  => present,
		#before => File['/etc/ssh/sshd_config'],
	}

	file { '/etc/ssh/sshd_config':
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		require => Package['openssh-package'],
		source  => 'puppet:///modules/base/sshd_config',
		notify  => Service['ssh-service'],
	}

	service { 'ssh-service':
		name       => $ssh_name,
		ensure     => running,
		enable     => true,
		#alias	   => 'ssh-service-two',
		#subscribe => File['/etc/ssh/sshd_config']
	}
}
