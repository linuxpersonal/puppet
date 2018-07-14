class ohmyzsh::install (
  $user     = hiera(ohmyzsh::user, "root"),
  $packages = ["zsh", "git"],
){

  package { $packages: }

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

  exec { 'Export Var HOME' :
    command => "/bin/bash -c \"export HOME=${homedir}\"",
  }

  exec { 'Run ohmyzsh.py':
    command     => "/usr/bin/python ${homedir}.ohmyzsh.py",
    creates     => "${homedir}.oh-my-zsh",
  }
  
  include ohmyzsh::config
}
