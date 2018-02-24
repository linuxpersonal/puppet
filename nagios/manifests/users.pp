class nagios::users () {

  user { "nagios": 
    ensure  => present, 
    groups  => 'nagcmd',
    require => Group['nagcmd']
  }

  group { "nagcmd": ensure =>  present, }

}
