class remiphp::repo (
$remi_source = "http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
){
    package { "remi-release":
      provider        => 'rpm',
      source          => $remi_source,
      ensure          => 'present',
    }   
}

