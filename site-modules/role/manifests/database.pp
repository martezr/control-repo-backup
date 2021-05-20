class role::database {  
  include profile::base_linux
  class { 'postgresql::server':
    ip_mask_allow_all_users => '0.0.0.0/0',
    pg_hba_conf_defaults    => false,
    listen_addresses        => '0.0.0.0',
    postgres_password       => 'TPSrep0rt!',
  }
  postgresql::server::pg_hba_rule { 'allow network access to the postgres database':
    description => 'Open up PostgreSQL for access from 0.0.0.0/0',
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '0.0.0.0/0',
    auth_method => 'md5',
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
