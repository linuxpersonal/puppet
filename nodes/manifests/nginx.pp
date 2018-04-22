class nodes::nginx {

include defaults
include defaults::test
include nginx

ohmyzsh::install { 'root': }

}
