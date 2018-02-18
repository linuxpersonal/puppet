class base::chronyd {
	package { 'chrony':
	ensure => present,
	}

	service { 'chronyd':
	ensure => running,
	enable => true,
	require => Package['chrony'],
	}
}
