class apache::params {

case $::osfamily {
    'Redhat': {
        $package_apache = hiera('apache::redhat_apache')
        $package_php    = hiera('apache::redhat_php')
        $service_name   = hiera('apache::redhat_service')
        }
    'Debian': {
        $package_apache = hiera('apache::debian_apache')
        $package_php    = hiera('apache::debian_php')
        $service_name   = hiera('apache::debian_service')
        }
    }

}
