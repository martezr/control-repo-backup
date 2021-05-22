class role::kumacp {  
  class { 'kuma':
    version => '1.1.6',
  }

  class { 'kuma::controlplane':
    manage_postgres => true,
  }
}
