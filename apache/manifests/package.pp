class apache::package (
  $package_apache = $::apache::package_apache,
  $package_php    = $::apache::package_php,
) {
    package { [ $package_apache, $package_php ]:
        ensure          => present,
        install_options => [ { '--enablerepo' => 'remi-php70' } ],
        require         => Package[ 'remi-release' ],
        } 
}
