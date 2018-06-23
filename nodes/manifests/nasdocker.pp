class nodes::nasdocker {

  useradd::user { "doc":
    nopasswd => true,
  }

  crontab::cron { "root": 
    cronjobs => [ 
      "@weekly /bin/docker export red -o /home/doc/docker/backups/dockers/red-$(date +%d).backup",
      "@weekly /bin/docker export white -o /home/doc/docker/backups/dockers/white-$(date +%d).backup",
    ],
  }

  package { [
    "axel",
    ]: }

}
