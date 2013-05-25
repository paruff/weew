class apache {
package {
apache:
ensure => installed
}

 file {
 "httpd.conf":
 mode => 644,
 owner => root,
 group => root,
 path => "/etc/apache2/httpd.conf",
 source => "puppet://bhaskar-laptop.localdomain/files/httpd.conf",
 }

 service {
 apache2:
 ensure => true,
 enable => true,
 subscribe => [ File["httpd.conf"], Package [apache] ],
 }
}
