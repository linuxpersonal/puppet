define vim::install {

  if $name == 'root' {
  $homedir = "/${name}"
  }

  unless $name == 'root' {
  $homedir = "/home/${name}"
  }

  file { "${homedir}/.vim/":
    ensure => directory,
    owner  => $name,
    group  => $name,
  }

  file { "${homedir}/.vim/bundle/":
    ensure  => directory,
    source  => 'puppet:///modules/vim/bundle/',
    recurse => remote,
    replace => 'no',
    require => File["${homedir}/.vim/"],
  }
  
  file { "${homedir}/.vimrc":
    source => 'puppet:///modules/vim/vimrc',
    ensure =>  present,
  }

}
