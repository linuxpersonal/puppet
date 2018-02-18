class phpmyadmin::user {
	include phpmyadmin::constants

	$username  = $phpmyadmin::constants::username
	$groupname = $phpmyadmin::constants::groupname
	$home      = $phpmyadmin::constants::home

	# User
	group { $groupname: ensure => present }

	user { $username:
		gid   => $groupname,
		shell => "/bin/false",
		home  => $home;
	}
}
