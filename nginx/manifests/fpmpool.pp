define nginx::fpmpool (
  $phpfpm_dir = "/etc/php-fpm.d/",
  $content    = "nginx/conf/phpfpm.conf.erb",
) {

    file { "${phpfpm_dir}/$name.conf":
      notify    => Service['php-fpm'],
      ensure    => 'present',
      content   => template($content),
    }
}
