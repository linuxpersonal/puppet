class nginx::repo
  {
    yumrepo { 'nginx_repo':
      baseurl  => 'http://nginx.org/packages/centos/$releasever/$basearch/',
      descr    => 'Nginx Repository',
      enabled  => 1,
      gpgcheck => 0,
    }
    package { "remi-release-7.3-2.el7.remi.noarch":
      provider        => 'rpm',
      source          => "http://rpms.remirepo.net/enterprise/remi-release-7.rpm",
      ensure          => 'present',
  }
}
