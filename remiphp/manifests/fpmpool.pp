define remiphp::fpmpool (
  $phpfpm_dir   = "/etc/php-fpm.d/",
  $content      = "remiphp/conf/phpfpm.conf.erb",
){

    file { "${phpfpm_dir}/$name.conf":
      notify    => Service['php-fpm'],
      ensure    => 'present',
      content   => template($content),
    }
}

