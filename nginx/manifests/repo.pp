class nginx::repo (
$nginx_repo  = "http://nginx.org/packages/centos/$releasever/$basearch/",
$remi_source = "http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
){
    yumrepo { 'nginx_repo':
      baseurl  => $nginx_repo,
      descr    => 'Nginx Repository',
      enabled  => 1,
      gpgcheck => 0,
    }
    package { "remi-release-7.3-2.el7.remi.noarch":
      provider        => 'rpm',
      source          => $remi_source,
      ensure          => 'present',
  }
}
