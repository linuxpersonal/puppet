class remiphp::params {

  case $::osfamily {
    'RedHat', 'CentOS':  { $package_php = hiera('remiphp::redhat_php') }
    /^(Debian|Ubuntu)$/: { $package_php = hiera('remiphp::redhat_php')  }
    default:             { warning ('Operating System not supported') }
  }

}
