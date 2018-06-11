define ohmyzsh::install (
  $user = $name
){

  include ohmyzsh::config

  if $user == 'root' { 
    $homedir = "/${user}/" 
  } else { 
    $homedir = "/home/${user}/" 
  }
  
  file { "${homedir}/.ohmyzsh.py":
    source  => 'puppet:///modules/ohmyzsh/ohmyzsh.py',
    mode    => '0755',
    replace => 'no'
  }

  exec { 'Run ohmyzsh.py':
    command     => "/usr/bin/python ${homedir}.ohmyzsh.py",
    creates     => "${homedir}.oh-my-zsh",
  }
}
