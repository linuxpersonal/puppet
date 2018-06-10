class nodes::nasdocker {

  useradd::user { "doc":
    nopasswd => true,
  }

  crontab::cron { "root": 
    cronjobs => [ 
      "10 3 7,14,21,28 * * /bin/docker export red -o /home/doc/docker/backups/red-$(date +%d).backup",
      "30 3 7,14,21,28 * * /bin/docker export white -o /home/doc/docker/backups/white-$(date +%d).backup",
    ],
  }

  package { [
    "axel",
    ]: }

}
