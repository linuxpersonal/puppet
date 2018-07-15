class apache::vhosts (
  $docroot    = $::apache::docroot,
  $vhost_dir  = $::apache::vhost_dir,
  $conf_file  = $::apache::conf_file,
  $conf_dir   = $::apache::conf_dir,
  $mode       = $::apache::conf_mode,
  $owner      = $::apache::conf_owner,
  $group      = $::apache::conf_group,
  $vhosts     = $::apache::vhosts,
) {

  file { $vhost_dir:
    ensure  => directory,
    recurse => true,
  }

$vhosts.each |String $vhostname| {
  file { "${vhost_dir}/${vhostname}":
    notify  => Service['httpd'],
    ensure  => 'present',
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    content => template("apache/vhost.conf.erb"),
    }
  }

$vhosts.each |String $vhostname| {
  file { "${docroot}/${vhostname}":
    ensure => 'directory',
    owner  => 'apache',
    group  => 'apache',
    mode   => '0755',
    }
  }

file { "${conf_dir}":
  notify  => Service['httpd'],
  ensure  => 'present',
  mode    => $mode,
  owner   => $owner,
  group   => $group,
  content => template("apache/httpd.conf.erb"),
  }
}
