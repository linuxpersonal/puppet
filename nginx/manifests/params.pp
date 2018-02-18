class nginx::params {

case $::osfamily {
    'Redhat': {
        $package_nginx = hiera('nginx::redhat_nginx')
        $package_php   = hiera('nginx::redhat_php')
        $service_name  = hiera('nginx::redhat_service')
        }
    'Debian': {
        $package_nginx = hiera('nginx::debian_nginx')
        $package_php   = hiera('nginx::debian_php')
        $service_name  = hiera('nginx::debian_service')
        }
    }

}
