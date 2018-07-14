class remiphp::install (
  $version       = hiera(remiphp::php_version, "remi-php56"),
  $service_name  = hiera(remiphp::service),
){
  include remiphp::repo

  case $::osfamily {
    'RedHat', 'CentOS':  { $package_php = hiera('remiphp::redhat_php') }
    /^(Debian|Ubuntu)$/: { warning ('Operating System not supported') }
    default:             { warning ('Operating System not supported') }
  }

  package { $package_php:
    ensure          => present,
    install_options => [ { '--enablerepo' => $version } ],
    require         => Package[ 'remi-release' ],
  } 

  service { $service_name:
    enable  => true,
    ensure  => running,
    require => Package['php-fpm'],
  }  

}
