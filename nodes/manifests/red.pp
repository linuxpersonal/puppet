class nodes::red {

  include nginx

  ohmyzsh::install { 'root': }

  nginx::phpfpm { 'php71': }

  nginx::vhosts { 
    "dokuwiki":
      domains => [ 
        "dokuwiki.skull.local",
        "doku.skull.local", 
      ];
    "red":
      domains => "red.skull.local",
      source  => true;
    "homeserver":
      domains => "homeserver.skull.local",
      source  => true;
  }

}
