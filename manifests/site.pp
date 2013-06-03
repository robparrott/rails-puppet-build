node default {

  include stdlib
                                                                                                                                                                     
  class { 'mysql::server': }
  
  class { 'apache':}
  class { 'apache::mod::ssl': }

#  apache::vhost { $fqdn:
#    vhost_name => $fqdn,
#    port => 80,
#    docroot => '/var/www/wordpress'
#  }
  
  include ruby
  include passenger
  include rvm
  
}