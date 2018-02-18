class vim(

  $vimpackages = $::vim::params::vimpackages,
  $vimdir      = $::vim::params::vimdir,
  $viminstall  = $::vim::params::viminstall,
  $userdir     = $::vim::params::userdir

) inherits vim::params {

class { '::vim::install': } ->
class { '::vim::config': }

}
