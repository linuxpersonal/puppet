class apache::service (
  $service_name = $::apache::service_name,
) {

    service { $service_name:
        enable  => true,
        ensure  => running,
        require => Package['httpd']
    }

}
