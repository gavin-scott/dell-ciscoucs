include ciscoucs

import '../data.pp'

# As a user I want to create Service Profile from Template.

transport_ciscoucs { 'ciscoucs':
  username => "${ciscoucs['username']}",
  password => " ",
  server   => "${ciscoucs['server']}",
}


ciscoucs_serviceprofile { 'serviceprofile_name':
  #serviceprofile_name  => "${ciscoucs_serviceprofile['serviceprofile_name']}",
  #organization         => " ",
  profile_dn            => "${ciscoucs_serviceprofile['profile_dn']}",
  ensure                => "${ciscoucs_serviceprofile['ensure']}",
  source_template       => "${ciscoucs_serviceprofile['source_template']}",
  transport             => Transport_ciscoucs['ciscoucs'],
  number_of_profiles    => "256",
}
