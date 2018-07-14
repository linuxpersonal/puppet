class nginx( 

  $service_name   = hiera('nginx::service'),
  $servername     = hiera('nginx::servername'),
  $vhost_dir      = hiera('nginx::vhost_dir'),

){

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
