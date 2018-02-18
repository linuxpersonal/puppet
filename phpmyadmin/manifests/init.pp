class phpmyadmin { 
class { '::phpmyadmin::packages': } 
-> class { '::phpmyadmin::config': } 
~> class { '::phpmyadmin::user': }
}
