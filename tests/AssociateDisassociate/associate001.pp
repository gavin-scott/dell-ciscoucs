include ciscoucs
import '../data.pp'

transport_ciscoucs { 'ciscoucs':
  username => "${ciscoucs['username']}",
  password => "${ciscoucs['password']}",
  server   => "${ciscoucs['server']}",
 
}

ciscoucs_serviceprofile_association { 'serviceprofile_name':
  ensure    => "${ciscoucs_profile_association_dissociation['ensure_present']}", 
  organization => "${ciscoucs_profile_association_dissociation['organization']}",
  serviceprofile_name => "${ciscoucs_profile_association_dissociation['serviceprofile_name']}",
  server_chassis_id => "${ciscoucs_profile_association_dissociation['server_chassis_id']}",
  server_slot_id => "${ciscoucs_profile_association_dissociation['server_slot_id']}",   
  
  #profile_dn => "${ciscoucs_profile_association_dissociation['profile_dn']}",
  #server_dn => "${ciscoucs_profile_association_dissociation['server_dn']}",
  
  transport      => Transport_ciscoucs['ciscoucs'],
}
