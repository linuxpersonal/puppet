define nginx::vhosts (
  $domains,
  $vhost_dir  = "/etc/nginx/sites-enabled",
  $content    = "nginx/vhosts/default.conf.erb",
  $doc_root   = "/home/$name/public_html",
  $source     = false,
  $hostname   = "${::fqdn}",
  $user_add   = true,
) {

  if $user_add {
    useradd::user { "$name": }  
  }

  file { $doc_root:
    ensure  => directory,
  }

  if $source {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['nginx'],
      ensure    => 'present',
      content   => template("nodes/$hostname/$name.conf"),
    }
  } else {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['nginx'],
      ensure    => 'present',
      content   => template($content),
    }
  }

  nginx::fpmpool { "$name": }

}
