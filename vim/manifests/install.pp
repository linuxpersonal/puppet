class vim::install(
  $vimpackages = $::vim::vimpackages
){
  package { $vimpackages: 
    ensure => present, 
  }
}
