class role::database {  
  include profile::base_linux
  class { 'postgresql::server':
    ip_mask_allow_all_users => '0.0.0.0/0',
    pg_hba_conf_defaults    => false,
    listen_addresses        => '0.0.0.0',
    postgres_password       => 'TPSrep0rt!',
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
