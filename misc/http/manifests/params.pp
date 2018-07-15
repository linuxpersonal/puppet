class apache::params {

case $::osfamily {
    'Redhat': {
        $package_apache = hiera('apache::redhat_apache')
        $service_name   = hiera('apache::redhat_service')
        }
    'Debian': {
        $package_apache = hiera('apache::debian_apache')
        $service_name   = hiera('apache::debian_service')
        }
    }

}
