class dhcpd::conf (
	$manual     = hiera('dhcpd::manual'),
	$dns        = hiera('dhcpd::dns'),
  $domain     = hiera('dhcpd::domain'),
  $subnet     = hiera('dhcpd::subnet'),
  $netmask    = hiera('dhcpd::netmask'),
  $min_ip     = hiera('dhcpd::min_ip'),
  $max_ip     = hiera('dhcpd::max_ip'),
  $broadcast  = hiera('dhcpd::broadcast'),
  $gateway    = hiera('dhcpd::gateway'),
  $lease      = hiera('dhcpd::lease'),
  $max_lease  = hiera('dhcpd::max_lease'),
  $reverse    = hiera('dhcpd::reverse'),
) {

	file { '/etc/dhcp/dhcpd.conf':
		ensure  => file,
		content => template('dhcpd/dhcpd.conf'),
	}

}
