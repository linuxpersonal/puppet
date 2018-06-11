class defaults::sshkeys {

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

  sshservice::authkeys { 'doc@fedt3.skull.local':
    user => 'root',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC7TqBNDWzL2TbB/bo6hsqC9vnJHlZECo7XJmmO9dkCfbM7LqM9h/t5LnIcLajcljnuZPN/iseYUY9GWr359YG+C+yHypeC4TRehs5cjr2jDJYCKuBxtuIDSGk8sSvgUmaBAr8XKm+kFUSZcOfsLD02Y0DWyH4QDkK08Txc2SaxAdXxi6MdAVsV6Y5V/l5W6BQoFkToIVRVaTEaRGesZycWf5NqLj0Dz4z486NXjsLI7mI+7coOMPZHpeOu3qvGUntX9PLEaOyl5L3Q9JojyPA54NtljpuuAKH9bkm5lUUvZe1ZqgUEVw3qXmS/uxDA0RTN7m8C/0LoxTReI9bnZm/R',
  }

  sshservice::authkeys { 'root@magento.skull.local':
    user => 'root',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC39K/oNGoyLaN7ZoyABI7TbAQRmMzGCC++d5SkJxB1tmTEGuU+vn5GcbaIWgNFM8YHaG9lZ2WU8uZxaqA7ZcfnAN88QNP77rt7VT0u9oXUeV7z8k+nw8ySPeAVdsi31+3efzkwxh+rn3kMENHsAxAQkQnT3wSyxBvx/0bG2/sK+SClW58bb81yutw+GABZst4vfsPLhtD8AEdjTqhYSm15JtnLFUAV+PtMXs+gPNF06/Xa6mVUVR2QZ6nPEcTsjc06m9T/zT+wDpS2EmYIWX/LwD96cLhz9PWkLKUYDh+fY7lT7R9/E/ye5VVmYRYooIhd4YANcJlBv44SDAGpNEin',
  }

}
