# Site.pp Manifest
# Skull.local Puppet
# Maintainer - Chris Do

node default {
  include defaults
}

node 'nginx.skull.local' {
  hiera_include('classes')
  sshservice::createuser { 'admin':
  nopasswd =>  true,
  keyname  => 'doc-ubuntu.skull.local',
  sshkey   => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqRTsNdgF6NKF28SBr9yi3Z6PLv9ianJeHGqViUmLzrrfAah95f6JPeabpYz5yEOkB/vnNgpPA1Sjl6p4/EiRm5D0ATRodVTdtRoncg+Y5VolLV+H4ew8ykNVe4nJ3cDGzexucy8QVEbrN/Edk1fLeKSnwqYT8mjk7DGFSI5eYsUNwBtGmB15sHHoJvvwbbOztNncNBYT5Nk3CRK7MvsExA0vgy6okbXaSyw9e2W0So6UI3tesMcmVM3Bom53RoIX6Ii54OpELkESGk8OUCyTiSyErpAtwnuMLAySUmzlkagbNOXLM6HxJlGUpIBYHCXFUkZlQbJ4Yy5wduXPq0wtp',
  }
}

node 'zabbix.skull.local' {
  hiera_include('classes')
}

node 'ddns.skull.local' {
  hiera_include('classes')
}
