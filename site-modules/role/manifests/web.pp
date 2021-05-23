class role::web {
  include profile::base_linux
  include nginx
   firewall { '015 nginx port':
    chain  => 'INPUT',
    dport  => 80,
    state  => 'NEW',
    action => 'accept',
    proto  => 'tcp',
    tag    => 'cis_firewall_rule',
  }
}
