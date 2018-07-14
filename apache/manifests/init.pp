class apache( 

    $package_apache = $::apache::params::package_apache,
    $service_name   = $::apache::params::service_name,
    $docroot        = hiera('apache::docroot'),
    $conf_file      = hiera('apache::con_file'),
    $conf_mode      = hiera('apache::con_mode'),
    $conf_owner     = hiera('apache::con_owner'), 
    $conf_group     = hiera('apache::con_group'),
    $vhosts         = hiera('apache::vhosts'),
    $log_dir        = hiera('apache::logdir'),
    $apace_ip       = hiera('apache::apache_ip'),
    $vhost_dir      = hiera('apache::vhost_dir'),
    $conf_dir       = hiera('apache::conf_dir'),

) inherits apache::params {

file { $docroot:
    ensure =>  directory,
    recurse => true,
  }

class { '::apache::package': } 
-> class { '::apache::vhosts': } 
~> class { '::apache::service': }

}
