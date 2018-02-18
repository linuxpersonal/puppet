class vim::config(
  $vimdir      = $::vim::vimdir,
  $viminstall  = $::vim::viminstall,
  $userdir     = $::vim::userdir,
) {

  file { $vimdir:
    ensure => 'directory'
  }

  archive {'master.zip':
  path         => '/tmp/master.zip',
  source       => 'https://github.com/vim/vim/archive/master.zip',
  extract      => true,
  extract_path => '/tmp',
  creates      => $viminstall,
  cleanup      => true,
  require      => File['/home/vim'],
  }

  file { '/tmp/compilevim.sh':
    source  => 'puppet:///modules/vim/compilevim.sh',
    mode    => '0755',
    recurse => true,
  }

  exec { 'Run compile.sh':
    command     => '/usr/bin/bash /tmp/compilevim.sh',
    creates     => $viminstall,
  }

  file { ['/usr/local/bin/vim', '/usr/bin/vim']:
    ensure => link,
    target => $viminstall,
  }

  file { "${userdir}/.vimrc":
    source => 'puppet:///modules/vim/vimrc',
    ensure =>  present,
  }

  exec { 'create vundle dir':
    command => '/usr/bin/mkdir -p /root/.vim/bundle/Vundle.vim',
    creates => "${userdir}/.vim/bundle/Vundle.vim",
  }

  vcsrepo { '/root/.vim/bundle/Vundle.vim':
    ensure   => present,
    provider => 'git',
    source   => 'https://github.com/VundleVim/Vundle.vim.git',
  }
  
  #  exec { 'Run vim install':
  #    command => "/usr/bin/vim +PluginInstall +qall",
  #    creates => "${userdir}/.vim/.installed",
  #  }
  # 
  #  file { "${userdir}/.vim/.installed":
  #    ensure  => present,
  #    content => "managed by puppet, do not remove"
  #  }
}

