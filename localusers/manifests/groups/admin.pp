class localusers::groups::admin {
	group { 'admin':
		ensure => present,
	}
}
