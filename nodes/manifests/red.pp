class nodes::red {

  include defaults
  include nginx
  
  ohmyzsh::install { 'root': }

  nginx::vhosts { 
    "dokuwiki.skull.local":
      alias => [ 
        "doku.skull.local",
        "www.doku.skull.local", 
      ];
    "red.skull.local":
      source => true;
  }

}
