class role::kumacp {  
  class { 'kuma':
    version => '1.2.0',
  }

  class { 'kuma::controlplane':
    manage_postgres => true,
  }
}
