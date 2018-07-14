class nodes::red {

  include nginx

  nginx::vhosts { 
    "dokuwiki":
      domains => [ 
        "dokuwiki.skull.local",
        "doku.skull.local", ],
      source  => true;
    "red":
      domains => [
        "red.skull.local",
        "repo.skull.local" ],
      source  => true;
    "homeserver":
      domains   => "nas.skull.local",
      proxypass => "10.1.1.40:8888";
    "jenkins":
      domains   => "jenkins.skull.local",
      proxypass => "white.skull.local:8080";
  }

  crontab::cron { "root":
    cronjobs => [ 

      "15 3 * * * /usr/bin/rsync -avz --delete --exclude='repo*' rsync://centos.melbourneitmirror.net/centos/7/os/x86_64/ /home/red/repos/centos/7/os/x86_64/",
      "30 4 * * * /usr/bin/rsync -avz --delete --exclude='repo*' rsync://centos.melbourneitmirror.net/centos/7/updates/x86_64/ /home/red/repos/centos/7/updates/x86_64/",
      "45 5 * * * /usr/bin/rsync -avz --delete --exclude='repo*' --exclude='debug' rsync://mirrors.rit.edu/epel/7/x86_64/ /home/red/repos/epel/7/x86_64/",

      "0 6 * * *  /usr/bin/createrepo --update /home/red/repos/centos/7/os/x86_64/",
      "15 6 * * * /usr/bin/createrepo --update /home/red/repos/centos/7/updates/x86_64/",
      "30 6 * * * /usr/bin/createrepo --update /home/red/repos/epel/7/x86_64/",

    ],  
  }

  package { [ "rsync","createrepo" ]: }

}
