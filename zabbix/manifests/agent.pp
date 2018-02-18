class zabbix::agent (
  $ipaddress = lookup('zabbix::serverip'),
  $hostname =  "${::fqdn}",
) {

  case $facts['os']['family'] {
      'Redhat': {
        $zabbixdir    = "/etc/zabbix/zabbix_agentd.d"
        $logfile      = "/var/log/zabbix/zabbix_agentd.log"
        
        package { 'zabbix-release-3.2-1.el7':
        provider        => 'rpm',
        source          => 'http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm',
        ensure          => present, 
        install_options => ['--nosignature'],
        }
      }
      'Debian': {
        $zabbixdir    = "/etc/zabbix/zabbix_agentd.conf.d"
        $logfile      = "/var/log/zabbix-agent/zabbix_agentd.log"

        exec { 'Download zabbix-release-3.2-1':
        command  => '/usr/bin/wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb -O /tmp/zabbix.deb',
        creates  => '/etc/zabbix',
        }
       
        exec {'Install Debian zabbix repo':
        command => '/usr/bin/dpkg -i /tmp/zabbix.deb',
        creates => '/etc/zabbix/',
        }
      }
  }
  
  package { 'zabbix-agent': 
    ensure => present, 
  }

  file { '/etc/zabbix/zabbix_agentd.conf':
    notify  => Service['zabbix-agent'],
    ensure  => present,
    content => template('zabbix/zabbix_agentd.conf.erb'),
  }

  service { 'zabbix-agent':
    ensure  => running,
    enable  => true,
    require => Package['zabbix-agent'],
  }
}
