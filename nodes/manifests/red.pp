class nodes::red {

  include defaults
  include nginx
  
  ohmyzsh::install { 'root': }

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
