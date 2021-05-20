class role::database {  
  include profile::base_linux
  class { 'postgresql::server':
    ip_mask_allow_all_users => '0.0.0.0/0',
    listen_addresses        => '0.0.0.0',
    pg_hba_conf_defaults    => false,
    postgres_password       => 'TPSrep0rt!',
  }
  postgresql::server::pg_hba_rule { 'allow local access to the postgres database':
    description => 'Open up PostgreSQL for access from localhost',
    type        => 'local',
    database    => 'all',
    user        => 'all',
    address     => '0.0.0.0/0',
    auth_method => 'ident',
   }
  postgresql::server::pg_hba_rule { 'allow local tcp access to the postgres database':
    description => 'Open up PostgreSQL for access from 0.0.0.0/0',
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '0.0.0.0/0',
    auth_method => 'md5',
   }
  postgresql::server::pg_hba_rule { 'allow network access to the postgres database':
    description => 'Open up PostgreSQL for access from 127.0.0.1/32',
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '127.0.0.1/32',
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
