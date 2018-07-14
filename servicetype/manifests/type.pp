class servicetype::type (
	$service_type = hiera('service_type',undef)
) {

	file { [
    '/etc/puppetlabs/',
    '/etc/puppetlabs/facter/',
		'/etc/puppetlabs/facter/facts.d',
		]:
		ensure  => directory,
		recurse => true,
	}
  
  if $service_type {
    file { '/etc/puppetlabs/facter/facts.d/service.txt':
      ensure  => file,
      content => "service=${service_type}",
    }
  }
}
