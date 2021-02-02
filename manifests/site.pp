## site.pp ##

File { backup => false }

## Node Definitions ##

node default {
  # do we have a trusted fact? if so, use that first (secure)
  #if $trusted['extensions']['pp_role'] =~ /\w+/ {
  #  include "role::${trusted['extensions']['pp_role']}"
  #} else {
    # otherwise fallback to a plain fact (usually an external fact [on disk])
  #  include "role::${facts['role']}"
  #}
  $role = $trusted['extensions']['pp_role']
  notify { "The role is: ${role}": }

  case $role {
    default: {
    }
    'webserver': {
      include profile::base
      include role::webserver
    }
    undef, '': {
      fail("${trusted['certname']} does not have a pp_role trusted fact!")
    }
  }
}

#node 'host1.mllab' {
#  include profile::base
#  include role::webserver
#}
