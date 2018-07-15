class apache( 

  $service_name   = hiera('apache::service'),
  $servername     = hiera('apache::servername'),
  $vhost_dir      = hiera('apache::vhost_dir'),

){
  package{ $service_name: }
  
  include apache::service

  file { $vhost_dir:
    ensure  => directory,
    recurse => true,
  }

  file { "/etc/${service_name}/conf/${service_name}.conf":
    notify  => Service[$service_name],
    ensure  => 'present',
    content => template("apache/conf/httpd.conf.erb"),
  }
}
