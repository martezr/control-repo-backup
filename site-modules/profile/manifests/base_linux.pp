class profile::base_linux {
   class {'::secure_linux_cis':
      time_servers  => ['0.pool.ntp.org', '1.pool.ntp.org'],
      profile_type  => 'server',
      allow_users   => ['trusteduser'],
   }
   firewall { '010 ssh port':
    chain  => 'INPUT',
    dport  => 22,
    state  => 'NEW',
    action => 'accept',
    proto  => 'tcp',
    tag    => 'cis_firewall_rule',
  }
  include hashi_stack::repo
  package { 'vault':
    ensure  => installed,
    require => Class['Hashi_stack::Repo'],
  }
}
