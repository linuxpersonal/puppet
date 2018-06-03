class servicetype::type (
	$service_type = hiera('service_type')
) {

	file { [
    '/etc/puppetlabs/',
    '/etc/puppetlabs/facter/',
		'/etc/puppetlabs/facter/facts.d',
		]:
		ensure  => directory,
		recurse => true,
	}                                                                                                                                                                                                                                              
	file { '/etc/puppetlabs/facter/facts.d/service.txt':
		ensure  => file,
		content => "service=${service_type}",
	}

}
