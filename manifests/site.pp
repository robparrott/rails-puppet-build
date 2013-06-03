node default {

  include stdlib

  class { 'apache':}
  class { 'apache::mod::ssl': }
  class { 'apache::mod::proxy_http': }

  apache::vhost::proxy { $fqdn:
      vhost_name => $fqdn,
      port => 80,
      dest => 'http://localhost:8080'
  }

# From master branch of apache module                                                                                                                                                      
#                                                                                                                                                                                          
#  apache::vhost { 'jenkins non-ssl':                                                                                                                                                      
#    servername   => '127.0.0.1',                                                                                                                                                          
#    port         => '80',                                                                                                                                                                 
#    rewrite_cond => '%{HTTPS} off',                                                                                                                                                       
#    rewrite_rule => '(.*) https://%{HTTPS_HOST}%{REQUEST_URI}',                                                                                                                           
#  }                                                                                                                                                                                       
#  apache::vhost { 'jenkins ssl':                                                                                                                                                          
#      servername => '127.0.0.1',                                                                                                                                                          
#      port       => '443',                                                                                                                                                                
#      ssl        => true,                                                                                                                                                                 
#      proxy_dest => 'http://localhost:8080/'                                                                                                                                              
#    }                                                                                                                                                                                     

  include jenkins

#
# Install some jenkins plugins
#
  $plugins = [ 
    'git',
    'github',
    'subversion',
    'chucknorris',
    'http_request',
    'jenkins-cloudformation-plugin',
    'ec2',
    's3',
    'batch-task',
    'ssh',
    'monitoring',
    'jabber'
  ]

  jenkins::plugin::install { $plugins: }
}