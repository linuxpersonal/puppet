## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.
# $topscope = "This is from our site.pp file"
# notify { 'Adding admin and permitting wheel permissions': }

node default {
  #   class { 'my_class': }
	include defaults
}

node "nginx.skull.local" {
  hiera_include('classes')
  sshservice::createuser { 'admin': 
  nopasswd =>  true,
  keyname  => 'doc-ubuntu.skull.local',
  sshkey   => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqRTsNdgF6NKF28SBr9yi3Z6PLv9ianJeHGqViUmLzrrfAah95f6JPeabpYz5yEOkB/vnNgpPA1Sjl6p4/EiRm5D0ATRodVTdtRoncg+Y5VolLV+H4ew8ykNVe4nJ3cDGzexucy8QVEbrN/Edk1fLeKSnwqYT8mjk7DGFSI5eYsUNwBtGmB15sHHoJvvwbbOztNncNBYT5Nk3CRK7MvsExA0vgy6okbXaSyw9e2W0So6UI3tesMcmVM3Bom53RoIX6Ii54OpELkESGk8OUCyTiSyErpAtwnuMLAySUmzlkagbNOXLM6HxJlGUpIBYHCXFUkZlQbJ4Yy5wduXPq0wtp',
  }
}

node "zabbix.skull.local" {
  include defaults
  include ohmyzsh::install
  include zabbix::server
}
