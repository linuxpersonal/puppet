class nginx::package (
  $package_nginx = $::nginx::package_nginx,
  $package_php   = $::nginx::package_php,
) {
    package { [ $package_nginx, $package_php ]:
        ensure          => present,
        install_options => [ { '--enablerepo' => 'remi-php71' } ],
        require         => Package[ 'remi-release-7.4-2.el7.remi.noarch' ]
        } 
}
