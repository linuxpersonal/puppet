class nodes::blue {

  package { [
    'rng-tools',
    'ipa-server',
  ]: }

  service { 'rngd':
    ensure  => running,
    require => Package['rng-tools']
  }

}
