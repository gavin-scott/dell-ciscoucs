include ciscoucs

transport_ciscoucs { 'ciscoucs':
  username => 'admin',
  password => 'admin',
  server   => '192.168.114.131',
}


ciscoucs_serviceprofile { 'name':
  name        => '',
  org         => '',
  dn          => 'org-root/testServiceProfile', 
  #ensure      => present,
  power_state => 'up',
  transport   => Transport_ciscoucs['ciscoucs'],
}
