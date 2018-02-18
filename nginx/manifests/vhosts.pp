class nginx::vhosts (
  $nginx_ip   = $::nginx::nginx_ip,
  $vhost_dir  = $::nginx::vhost_dir,
  $conf_file  = $::nginx::conf_file,
  $mode       = $::nginx::conf_mode,
  $owner      = $::nginx::conf_owner,
  $group      = $::nginx::conf_group,
  $vhosts     = $::nginx::vhosts,
) {

  file { $vhost_dir:
    ensure  => directory,
    recurse => true,
  }

$vhosts.each |String $vhostname|{
  file { "${vhost_dir}/${vhostname}.conf":
    notify  => Service['nginx'],
    ensure  => 'present',
    replace => 'no',
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    content => template("nginx/vhosts/default.conf.erb"),
    }
  }

file { "/etc/nginx/nginx.conf":
  notify  => Service['nginx'],
  ensure  => 'present',
  replace => 'no',
  mode    => $mode,
  owner   => $owner,
  group   => $group,
  content => template("nginx/conf/nginx.conf.erb"),
  }
}
