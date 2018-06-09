define nginx::php (
  $package_php   = $::nginx::package_php,
) {
    package { $package_php:
        ensure          => present,
        install_options => [ { '--enablerepo' => "remi-$name" } ],
        require         => Package[ 'remi-release' ]
        } 
}
