define sshservice::createuser (
$shellbash = true,
$sshgroup = undef,
$nopasswd = false,
$sshkey = undef,
$keyname = undef,
$password = undef,
) {

  #  if $trusted['certname'] == 'ansible.skull.local' {
  
  if $shellbash { $shell = '/bin/bash' }
  else { $shell = '/bin/false' }

  user { $name:
      ensure     => present,
      shell      => $shell,
      home       => "/home/${name}",
      managehome => true,
      groups     => $sshgroup,
      password   => $password,
  }

  file { "/home/${name}":
    ensure  => directory,
    owner   => $name,
    group   => $name,
    require => User["${name}"],
  }

  if $sshkey and $keyname {
    ssh_authorized_key { "${keyname}.skull.local":
          user    => $name,
          type    => 'rsa',
          key     => $sshkey,
    }
  }

    if $nopasswd {
      sudo::conf { $name: 
        content => "%${name} ALL=(ALL) NOPASSWD: ALL",
      }
  }
}

