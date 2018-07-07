class jenkins(
  $ipaddress = $::ipaddress
) {
  
  yumrepo { 'jenkins_repo':
    baseurl  => 'http://pkg.jenkins.io/redhat-stable',
    descr    => 'jenkins-repo',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key'
  }
  
  package { ['java-1.8.0-openjdk.x86_64', 'jenkins']:
    ensure  => present,
    require => Yumrepo['jenkins_repo'],
  }

  file {'/etc/profile':
    source => "puppet:///modules/jenkins/profile",
    ensure =>  present,
  }

  service {'jenkins':
    enable => true,
    ensure  => running,
    require => Package['jenkins']
  }

  file { "/etc/nginx/sites-enabled/${ipaddress}":
    ensure  => present,
    content => template("jenkins/vhosts.erb")
  }
}
