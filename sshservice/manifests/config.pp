class sshservice::config (
  $sshport    = hiera('ssh::sshport'),
  $permitroot = hiera('ssh::permitroot'),
) {
	service { 'sshd':
		ensure => running,
		enable => true,
		subscribe => File['/etc/ssh/sshd_config']
	}

	file { '/etc/ssh/sshd_config':
		ensure => present,
		content => template('sshservice/sshd_config.erb'),
	}
}
