class phpmyadmin::constants {
	$username  = "phpmyadmin"
	$groupname = "phpmyadmin"

	case $facts[os][family] {
			'RedHat': {
				$home          = "/usr/share/phpMyAdmin"
				$document_root = "/usr/share/phpMyAdmin"
				$htpasswd_file = "/etc/phpMyAdmin/htpasswd"
				$package       = "phpMyAdmin"
			}
			'Debian': {
				$home          = "/usr/share/phpmyadmin"
				$document_root = "/usr/share/phpmyadmin"
				$htpasswd_file = "/etc/phpmyadmin/htpasswd"
				$package       = "phpmyadmin"
			}
		default: {
			fail "Phpmyadmin::Constants: ${facts[operatingsystem]} is not a supported OS"
		}
	}
}
