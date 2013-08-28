class my_fw::pre {
  Firewall {
    require => undef,
  }

  # Default firewall rules
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  } ->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '002 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }->
  firewall { '003 accept SSH':
    port   => [22],
    proto   => 'tcp',
    action  => 'accept',
  }
  # ->
  # firewall { '100 allow http and https access':
  #   port   => [80, 443],
  #   proto  => tcp,
  #   action => accept,
  # }

}
