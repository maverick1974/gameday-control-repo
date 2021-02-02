# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::webserver
class profile::webserver {
  class { 'apache': }

apache::vhost { 'mllab.com':
  serveraliases => [],
  docroot       => '/var/www/mllab',
  docroot_owner => 'apache',
  docroot_group => 'apache',
  port          => '80',
}

file { 'site-content':
    ensure  => present,
    mode    => '0644',
    path    => '/var/www/mllab/index.html/',
    content => '<h1>Hello World! </h1> <br/> <h2> Test page </h2>',
  }
}
