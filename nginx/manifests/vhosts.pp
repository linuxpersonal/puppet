define nginx::vhosts (
  $vhost_dir  = "/etc/nginx/sites-enabled",
  $content    = "nginx/vhosts/default.conf.erb",
  $doc_root   = "/var/www/html/$name",
  $domain     = $name,
  $source     = false,
  $alias      = undef,
  $hostname   = "${::fqdn}",
) {
  
  file { $doc_root:
    ensure  => directory,
    recurse => true,
  }

  if $source {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['nginx'],
      ensure    => 'present',
      source    => "puppet:///modules/nodes/$hostname/$name.conf",
    }
  } else {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['nginx'],
      ensure    => 'present',
      content   => template($content),
    }
  }

}
