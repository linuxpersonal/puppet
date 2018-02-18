class defaults {

  include defaults::params
  include defaults::packages
  include defaults::services
  include servicetype::type
  include squid::clients
  
  sshservice::authkeys { 'management.skull.local':
    user => 'root',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDCzFGrLlkt4zI/Lhj3w7Cb9N5oAeO0QuUARtD0zrIqpp3Wioo+BvHzZt5XaNF2Eq3+ND5YtchSnatrmhCj1M1cHwarCHrQRlAIIfH3CrW/oEg7hAtV0Rgnhb0HerWaJ5ktTEwGP+JfJOL7JF+vPycio8xF6cNaoUZvjZKSDqk6WK8OO5lPritThyIcljw9OqES82GP4vbPhoLBORs3HWV+Wj5bnfZEL7aH9GS4sQPfQ2uUwFsvX9GPrmDqG6RH7d1rVaeG3WjF8aEwvEoHCTtSnX3h1IN5G/3g2PYM47UjPvYHfyPN7beOaHt6luIdLP79AtKu8rmgtYOAd/aijv+f',
  }
  
  sshservice::createuser { 'ansible':
    keyname  => 'ansible.skull.local',
    nopasswd => true,
    sshkey      => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDmIY8OOvJcDNux3PlNyDIVgPuf0kaspeehNuSFWNURPeLTm5C7/vH/OjbGt9Cols1eiAsgqPsxybOndIVGabOtVGIfUv6GW0pICL2f/3FNyJ8B5Bp0YmrRLM6nNRQ+FCek0xmgQAuMWuRN2B9XCpO5wNWSfdyJ5JlpKh0HEtLBCIwVT65l1NUvhIl+hyaCt9Kb73xAjWuX5DOxaVgMYNZ+0VD6XtpIsMMV5gMubHGWHxoW38DEtAJp5wMY3vxrYWpaDTbMjgudB6cXNEYsbDAb1HrX99OSer8yMx9YGYRa6b+P3/7qIpPT9SSze2DKqiF1Ub4ZsHPwwFiaw4g1c2VT'
  }

  unless $::fqdn == 'zabbix.skull.local' {
    include zabbix::agent
  }
}
