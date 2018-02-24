class nodes::nginx {

include defaults
include defaults::test
include ohmyzsh::install
include ohmyzsh::config
include nginx

}
