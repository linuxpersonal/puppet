class nginx::php (
  $package_php   = $::nginx::package_php,
  $version       = hiera(php::php_version, "remi-php56"),
) {
    package { $package_php:
        ensure          => present,
        install_options => [ { '--enablerepo' => $version } ],
        require         => Package[ 'remi-release' ],
        } 
}
