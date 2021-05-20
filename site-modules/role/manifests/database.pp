class role::database {  
  include profile::base_linux
  class { 'postgresql::server':
    postgres_password => 'TPSrep0rt!',
  }
   firewall { '015 postgresql port':
    chain  => 'INPUT',
    dport  => 5432,
    state  => 'NEW',
    action => 'accept',
    proto  => 'tcp',
    tag    => 'cis_firewall_rule',
  }
}
