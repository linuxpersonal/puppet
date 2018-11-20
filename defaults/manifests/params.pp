class defaults::params {
    
		case $::osfamily {
    'Redhat': {
    $def_packages = [
      'telnet',
      'epel-release',
      'links',
      'wget',
      'htop',
      'iftop',
      'sysstat',
      'net-tools',
      'iotop',
      'mlocate',
      'tmux',
      'chrony',
      'bind-utils',
      'ncdu',
      'bash-completion' ]
    $chronyd = 'chronyd'
    $update = '/usr/bin/yum update -y' 
      }

    'Debian': {
    $def_packages = [
      'telnet',
      'links',
      'wget',
      'htop',
      'iftop',
      'sysstat',
      'net-tools',
      'iotop',
      'mlocate',
      'tmux',
      'chrony',
      'ncdu',
      'bash-completion' ]
    $chronyd = 'chrony'
    $update = '/usr/bin/apt update && /usr/bin/upgrade -y' 
      }
    }

}
