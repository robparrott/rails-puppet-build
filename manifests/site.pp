node default {

  include stdlib

  class { 'apache':}
  class { 'apache::mod::ssl': }
  class { 'apache::mod::php': }

  apache::vhost::proxy { $fqdn:
      vhost_name => $fqdn,
      port => 80,
      dest => 'http://localhost:8080'
  }                                                                                                                                                                                  

  class { 'wordpress':
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
    db_user     => 'wordpress',
    db_password => 'wordpress',
    install_dir => '/var/www/wordpress',
}

  include wordpress

}