class phpmyadmin::config {
	include phpmyadmin::constants

	$htpasswd_file = $phpmyadmin::constants::htpasswd_file

	if $facts[os][family] in 'RedHat' {
		
    file { "/etc/phpMyAdmin":
				mode    => '0755',
    }
	
    file { "/etc/phpMyAdmin/config.inc.php":
				ensure  => present,
				owner   => root,
				group   => $groupname,
				mode    => '0440',
		}
	}

	file { $htpasswd_file:
		content => "# Content is not Puppet managed. See htpasswd(1).\n",
		replace => false,
		mode    => '0644',
	}
}
