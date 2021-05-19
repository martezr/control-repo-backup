class profile::base_linux {
   class {'::secure_linux_cis':
      time_servers  => ['0.pool.ntp.org', '1.pool.ntp.org'],
      profile_type  => 'server',
      allow_users   => ['trusteduser'],
   }
}
