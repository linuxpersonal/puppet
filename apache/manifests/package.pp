class apache::package (
  $package_apache = $::apache::package_apache,
  $package_php    = $::apache::package_php,
) {
    package { [ $package_apache, $package_php ]:
        ensure          => present,
        install_options => [ { '--enablerepo' => 'remi-php71' } ],
        require         => Package[ 'remi-release-7.3-2.el7.remi.noarch' ],
        } 
}
