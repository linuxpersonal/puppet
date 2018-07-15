class apache::package (
  $package_apache = $::apache::package_apache,
) {
    package { [ $package_apache, ]:
        ensure          => present,
        } 
}
