define crontab::cron (
$user = $name,
$cronjobs,
){

  file { "/var/spool/cron/$user": 
    ensure  => file,
    content => template('crontab/crontab.erb'),
  }

}
