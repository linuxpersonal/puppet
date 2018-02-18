class phpmyadmin::packages {
	include phpmyadmin::constants

	$package = $phpmyadmin::constants::package

	package { $package: }
}
