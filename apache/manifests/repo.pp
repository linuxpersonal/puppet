class apache::repo
  {
    package { "remi-release-7.4-1.el7.remi.noarch":
      provider        => 'rpm',
      source          => "http://rpms.remirepo.net/enterprise/remi-release-7.rpm",
      ensure          => 'present',
  }
}
