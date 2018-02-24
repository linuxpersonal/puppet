class nagios::plugins {
  file { '/usr/lib64/nagios/plguins/check_mem':
  ensure => present,
  source => 'puppet:///modules/nagios/plugins/check_mem',
}
