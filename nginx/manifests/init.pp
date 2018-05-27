class nginx( 

    $package_nginx  = $::nginx::params::package_nginx,
    $service_name   = $::nginx::params::service_name,
    $package_php    = $::nginx::params::package_php,
    $docroot        = hiera('nginx::docroot'),
    $conf_file      = hiera('nginx::con_file'),
    $conf_mode      = hiera('nginx::con_mode'),
    $conf_owner     = hiera('nginx::con_owner'), 
    $conf_group     = hiera('nginx::con_group'),
    $servername     = hiera('nginx::servername'),
    $log_dir        = hiera('nginx::logdir'),
    $nginx_ip       = hiera('nginx::nginx_ip'),
    $conf_pidfile   = hiera('nginx::con_pidfile'),
    $vhost_dir      = hiera('nginx::vhost_dir'),
    $conf_dir       = hiera('nginx::conf_dir'),

) inherits nginx::params {

  class { '::nginx::repo': } 
  -> class { '::nginx::package': } 
  ~> class { '::nginx::service': }

  file { $docroot:
    ensure =>  directory,
    recurse => true,
  }

  file { $vhost_dir:
    ensure  => directory,
    recurse => true,
  }

  file { $conf_dir:
    notify  => Service['nginx'],
    ensure  => 'present',
    content => template("nginx/conf/nginx.conf.erb"),
  }

  file { $log_dir:
    ensure  => 'present',
    owner   => 'nginx',
    group   => 'nginx',
    recurse => true,
  }

}
