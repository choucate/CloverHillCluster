node 'node1.linux.com' {                                                # applies to node1 only
    file {'/tmp/example-ip':                                            # resource type file and filename
      ensure  => present,                                               # make sure it exists
      mode    => '0644',                                                # file permissions
      content => "Here is my Public IP Address: ${ipaddress_ens33}.\n",  # note the ipaddress_eth0 fact
    }
}

node 'rocky.linux.com' {
  notify { 'this is the puppet master': }
}

node default {}
