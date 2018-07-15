define apache::vhosts (
  $domains,
  $vhost_dir  = "/etc/httpd/sites-enabled",
  $content    = "apache/vhosts/default.conf.erb",
  $doc_root   = "/home/$name/public_html",
  $source     = false,
  $proxypass  = undef,
  $hostname   = "${::fqdn}",
  $user_add   = true,
){

  if ! is_array($domains) {
    $apache_domain = [$domains] 
  } else {
    $apache_domain = $domains
  }

  if $user_add {
    useradd::user { "$name": }  
  }

  file { $doc_root:
    ensure  => directory,
  }

  if $source {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['httpd'],
      ensure    => 'present',
      content   => template("nodes/$hostname/$name.conf"),
    }
  } elsif $proxypass {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['httpd'],
      ensure    => 'present',
      content   => template("nodes/$hostname/proxypass.conf"),
    } 
  } else {
    file { "${vhost_dir}/$name.conf":
      notify    => Service['httpd'],
      ensure    => 'present',
      content   => template($content),
    }
  }
}
