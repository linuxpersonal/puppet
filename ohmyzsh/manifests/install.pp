class ohmyzsh::install {

    file { '/root/.ohmyzsh.py':
    source  => 'puppet:///modules/ohmyzsh/ohmyzsh.py',
    mode    => '0755',
    replace => 'no'
}

  exec { 'Run ohmyzsh.py':
    command     => '/usr/bin/python /root/.ohmyzsh.py',
    creates     => '/root/.oh-my-zsh',
  }
}
