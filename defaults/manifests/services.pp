class defaults::services (
) {
    schedule {'update-daily':
     period  => daily,
     range   => '0:00 - 01:00',
    }
  
    exec { '/usr/bin/updatedb':
      schedule => 'update-daily',
    }
}
