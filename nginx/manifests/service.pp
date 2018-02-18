class nginx::service (
  $service_name = $::nginx::service_name,
) {

    service { $service_name:
        enable  => true,
        ensure  => running,
        require => Package['nginx']
    }

}
