class nginx::repo (
$nginx_repo  = 'http://nginx.org/packages/centos/$releasever/$basearch/',
$remi_source = "http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
){
    package { "remi-release":
      provider        => 'rpm',
      source          => $remi_source,
      ensure          => 'present',
    }
    yumrepo { 'nginx_repo':
      baseurl  => $nginx_repo,
      descr    => 'Nginx Repository',
      enabled  => 1,
      gpgcheck => 0,
    }
}
