class jenkins::server (
  $packages = ['java-1.8.0-openjdk','jenkins','initscripts'],
){
  
  yumrepo { 'jenkins_repo':
    baseurl  => 'http://pkg.jenkins.io/redhat-stable',
    descr    => 'jenkins-repo',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key'
  }
  
  package { $packages:
    ensure  => present,
    require => Yumrepo['jenkins_repo'],
  }

  file {'/etc/profile':
    source => "puppet:///modules/jenkins/profile",
    ensure =>  present,
  }

  service {'jenkins':
    enable  => true,
    ensure  => running,
    require => Package['jenkins']
  }
}
