class defaults::services (
  $chronyd      = $::defaults::params::chronyd,
  $update       = $::defaults::params::update,
) {
    service { $chronyd:
     ensure  => running,
     enable  => true,
    }
    
    schedule {'update-daily':
     period  => daily,
     range   => '0:00 - 01:00',
    }
  
    exec { '/usr/bin/updatedb':
      schedule => 'update-daily',
    }
    
    exec { $update:
      schedule => 'update-daily',
    }
}
