class nginx::repo (
$nginx_repo  = 'http://nginx.org/packages/centos/$releasever/$basearch/',
){
    yumrepo { 'nginx_repo':
      baseurl  => $nginx_repo,
      descr    => 'Nginx Repository',
      enabled  => 1,
      gpgcheck => 0,
    }
}
