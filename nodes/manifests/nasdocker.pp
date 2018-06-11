class nodes::nasdocker {

  useradd::user { "doc":
    nopasswd => true,
  }

  crontab::cron { "root": 
    cronjobs => [ 
      "10 1 7,14,21,28 * * \
      /bin/docker export red -o /home/doc/docker/backups/dockers/red-$(date +%d).backup",
      "30 1 7,14,21,28 * * \
      /bin/docker export white -o /home/doc/docker/backups/dockers/white-$(date +%d).backup",
    ],
  }

  package { [
    "axel",
    ]: }

}
