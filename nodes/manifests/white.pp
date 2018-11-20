class nodes::white {

  include firewall::iptables

  firewall { '006 Allow inbound nrpe 5666':
    dport    => 5666,
    source   => '10.1.1.203/32',
    proto    => tcp,
    action   => accept,
  }

  firewall { '006 Allow inbound jenkins 8080':
    dport    => 8080,
    proto    => tcp,
    action   => accept,
  }

}
