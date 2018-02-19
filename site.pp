# Site.pp Manifest
# Skull.local Puppet
# Maintainer - Chris Do

node default {
  hiera_include('classes')
}
