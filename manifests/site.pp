node default {

  include stdlib
  include apache
  include jenkins


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