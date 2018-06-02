class nginx( 

    $package_nginx  = $::nginx::params::package_nginx,
    $service_name   = $::nginx::params::service_name,
    $package_php    = $::nginx::params::package_php,
    $servername     = hiera('nginx::servername'),
    $vhost_dir      = hiera('nginx::vhost_dir'),

) inherits nginx::params {

  package{ "nginx": }
  include nginx::repo
  include nginx::service

  file { $vhost_dir:
    ensure  => directory,
    recurse => true,
  }

  file { '/etc/nginx/nginx.conf':
    notify  => Service['nginx'],
    ensure  => 'present',
    content => template("nginx/conf/nginx.conf.erb"),
  }

}
