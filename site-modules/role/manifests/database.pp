class role::database {  
  include profile::base_linux
  class { 'postgresql::server':
    postgres_password => 'TPSrep0rt!',
  }
}
