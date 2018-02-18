class base::apache {

	#$package = $osfamily ? {
	#	'RedHat' = 'httpd',
	#	'Debian' = 'apache2',
	#	 default = 'httpd',
	#}

	package { 'apache_install':
		name => $::osfamily ? {
		'RedHat' = 'httpd',
		'Debian' = 'apache2'
		 default = 'httpd',

		ensure => present
	}

}
