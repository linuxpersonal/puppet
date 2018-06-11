class nodes::magento {

  crontab::cron { "root": 
    cronjobs => [ 
      "0 2 * * * /backups/rsync.sh ddns",                                                       
      "30 2 * * * /backups/rsync.sh sickrage",
      "0 3 * * * /backups/rsync.sh squid",
      "30 3 * * * /backups/rsync.sh ansible",
      "0 4 * * * /backups/rsync.sh puppet",
      "30 4 * * * /backups/rsync.sh nagios",
    ],
  }
}

