# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::nginx
class profile::nginx {
  nginx::resource::server { 'www.puppetlabs.com':
  www_root => '/var/www/www.puppetlabs.com',
  }
}
