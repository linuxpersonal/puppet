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
  
  file { '/root/.oh-my-zsh/themes/cute-theme.zsh-theme':
    ensure  => present,
    source  => 'puppet:///modules/ohmyzsh/cute.theme',
    replace => 'no',
    require => Exec['Run ohmyzsh.py']
  }

}
