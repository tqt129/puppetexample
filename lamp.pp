class lamp {


$lamp_packages = ['httpd','mysql','php']
package { $lamp_packages: 
   ensure => 'installed' 
}

service { 'httpd':
   ensure  => 'running',
}
service { 'mariadb':
   ensure  => 'running',
}

file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',
  require => Package['httpd'],    
}
file { '/var/www/html/index.html':
  ensure => file,
  content => 'hello there',    
  require => Package['httpd'],      
}
}
include lamp
