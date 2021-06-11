class role::database {  
  include profile::base_linux
  class { 'postgresql::server':
    ip_mask_allow_all_users => '0.0.0.0/0',
    listen_addresses        => '0.0.0.0',
    pg_hba_conf_defaults    => true,
    postgres_password       => 'TPSrep0rt!',
  }
}
