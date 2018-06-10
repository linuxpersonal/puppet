class apache::repo
  {
    package { "remi-release":
      provider        => 'rpm',
      source          => "http://rpms.remirepo.net/enterprise/remi-release-7.rpm",
      ensure          => 'present',
  }
}
