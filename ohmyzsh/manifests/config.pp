class ohmyzsh::config ( 
$theme = hiera('ohmyzsh::theme')
) {
    file { '/root/.zshrc':
    ensure =>  present,
    content  => template('ohmyzsh/zshrc.erb'),
}

  file { '/root/.oh-my-zsh/themes/cute-theme.zsh-theme':
    ensure  => present,
    source  => 'puppet:///modules/ohmyzsh/cute.theme',
    replace => 'no',
  }

}
