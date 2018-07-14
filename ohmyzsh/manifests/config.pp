class ohmyzsh::config ( 
$theme = hiera('ohmyzsh::theme'),
$user  = hiera(ohmyzsh::user, "root"),
$alias = hiera('ohmyzsh::alias')
) {

  if $user == 'root' { 
    $homedir = "/${user}/" 
  } else { 
    $homedir = "/home/${user}/" 
  }

  file { "${homedir}.zshrc":
    ensure =>  present,
    content  => template('ohmyzsh/zshrc.erb'),
  }

  file { "${homedir}.oh-my-zsh/themes/cute-theme.zsh-theme":
    ensure  => present,
    source  => 'puppet:///modules/ohmyzsh/cute.theme',
    replace => 'no',
  }
}
