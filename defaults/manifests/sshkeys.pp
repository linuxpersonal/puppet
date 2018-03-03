class defaults::sshkeys {

  sshservice::authkeys { 'management.skull.local':
    user => 'root',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDCzFGrLlkt4zI/Lhj3w7Cb9N5oAeO0QuUARtD0zrIqpp3Wioo+BvHzZt5XaNF2Eq3+ND5YtchSnatrmhCj1M1cHwarCHrQRlAIIfH3CrW/oEg7hAtV0Rgnhb0HerWaJ5ktTEwGP+JfJOL7JF+vPycio8xF6cNaoUZvjZKSDqk6WK8OO5lPritThyIcljw9OqES82GP4vbPhoLBORs3HWV+Wj5bnfZEL7aH9GS4sQPfQ2uUwFsvX9GPrmDqG6RH7d1rVaeG3WjF8aEwvEoHCTtSnX3h1IN5G/3g2PYM47UjPvYHfyPN7beOaHt6luIdLP79AtKu8rmgtYOAd/aijv+f',
  }
  
  sshservice::authkeys { 'doc-ubuntu.skull.local':                                                                                                                                             
    user => 'root',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqRTsNdgF6NKF28SBr9yi3Z6PLv9ianJeHGqViUmLzrrfAah95f6JPeabpYz5yEOkB/vnNgpPA1Sjl6p4/EiRm5D0ATRodVTdtRoncg+Y5VolLV+H4ew8ykNVe4nJ3cDGzexucy8QVEbrN/Edk1fLeKSnwqYT8mjk7DGFSI5eYsUNwBtGmB15sHHoJvvwbbOztNncNBYT5Nk3CRK7MvsExA0vgy6okbXaSyw9e2W0So6UI3tesMcmVM3Bom53RoIX6Ii54OpELkESGk8OUCyTiSyErpAtwnuMLAySUmzlkagbNOXLM6HxJlGUpIBYHCXFUkZlQbJ4Yy5wduXPq0wtp',
  }

  sshservice::authkeys { 'fedt3.skull.local':                                                                                                                                             
    user => 'root',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDlTXfWfboK4HEiRqSMnBbeTWV12l7H62QNtjxVoWqo4YX9Qf9HRERnwzmAZgk1Dbmk5IWwThktCHsqaauc2A2ffa9lQnDZHI4QuI07JeSCrfoCymzVz35lrT+LBhp/QICo+rzOv/z/WQca1FMjfu39TQYOCDElC9msZET63ZYX+4JnUWd55vA7hQSd4+5eg0oJ9m7jZkI1YiXo33Ol1hIZSEsjkoxboq77NSDv47IBKv0uadF4lhsnIGEPBNcdzIYLceEbGLczXyLeKtoPI3Y40+bnG9eDl8wuKxq2d1DxZurWiJovqhZcXXOSjTLyb3X3uiAo3xeqy3SAKskqRdyt',
  }
  
  sshservice::authkeys { 'ansible.skull.local':
    user   => 'root',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDmIY8OOvJcDNux3PlNyDIVgPuf0kaspeehNuSFWNURPeLTm5C7/vH/OjbGt9Cols1eiAsgqPsxybOndIVGabOtVGIfUv6GW0pICL2f/3FNyJ8B5Bp0YmrRLM6nNRQ+FCek0xmgQAuMWuRN2B9XCpO5wNWSfdyJ5JlpKh0HEtLBCIwVT65l1NUvhIl+hyaCt9Kb73xAjWuX5DOxaVgMYNZ+0VD6XtpIsMMV5gMubHGWHxoW38DEtAJp5wMY3vxrYWpaDTbMjgudB6cXNEYsbDAb1HrX99OSer8yMx9YGYRa6b+P3/7qIpPT9SSze2DKqiF1Ub4ZsHPwwFiaw4g1c2VT',
  }


}
