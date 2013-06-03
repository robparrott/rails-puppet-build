node default {

  include stdlib
                                                                                                                                                                     
  class { 'mysql::server': }
  class { 'mysql::php':    }
  
  class { 'apache':}
  class { 'apache::mod::ssl': }
  class { 'apache::mod::php': }

  apache::vhost { $fqdn:
    vhost_name => $fqdn,
    port => 80,
    docroot => '/var/www/wordpress'
  }
  
  class { 'wordpress':
    version        => '3.5'
#    wp_owner    => 'wordpress',
#    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => 'wordpress',
    install_dir => '/var/www/wordpress',
}

  include wordpress

}