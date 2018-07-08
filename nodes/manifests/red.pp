class nodes::red {

  include nginx

  ohmyzsh::install { 'root': }

  nginx::php { 'php71': }

  nginx::vhosts { 
    "dokuwiki":
      domains => [ 
        "dokuwiki.skull.local",
        "doku.skull.local", 
      ],
      source  => true;
    "red":
      domains => [
        "red.skull.local",
        "repo.skull.local",
        "10.1.1.2",
      ],
      source  => true;
    "homeserver":
      domains => "homeserver.skull.local",
      source  => true;
  }

  crontab::cron { "root":
    cronjobs => [ 

      "15 5 * * * /usr/bin/rsync -avz --delete --exclude='repo*' rsync://centos.melbourneitmirror.net/centos/7/os/x86_64/ /home/red/repos/centos/7/os/x86_64/",
      "30 6 * * * /usr/bin/rsync -avz --delete --exclude='repo*' rsync://centos.melbourneitmirror.net/centos/7/updates/x86_64/ /home/red/repos/centos/7/updates/x86_64/",
      "45 8 * * * /usr/bin/rsync -avz --delete --exclude='repo*' --exclude='debug' rsync://mirrors.rit.edu/epel/7/x86_64/ /home/red/repos/epel/7/x86_64/",

      "0 9 * * *  /usr/bin/createrepo --update /home/red/repos/centos/7/os/x86_64/",
      "15 9 * * * /usr/bin/createrepo --update /home/red/repos/centos/7/updates/x86_64/",
      "30 9 * * * /usr/bin/createrepo --update /home/red/repos/epel/7/x86_64/",

    ],  
  }

  package { [ "rsync","createrepo" ]: }

}
