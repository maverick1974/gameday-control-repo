# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::webserver
class profile::webserver {
  class { 'apache': }

apache::vhost { 'mllab.com':
  server_name   => 'mllab.com',
  serveraliases => [],
  docroot       => '/var/www/mllab',
  docroot_owner => 'www-data',
  docroot_group => 'www-data',
  port          => '80',
  directories   => [ { path => '/var/www/', allow => 'from all', allow_override => ['All'] }   ],
  env_variables => [],
  priority      => '1',
}

file { 'site-content':
    ensure  => present,
    mode    => '0644',
    path    => '/var/www/mllab.com/',
    content => '<h1>Hello World! </h1> <br/> <h2> Test page </h2>',
  }
}
