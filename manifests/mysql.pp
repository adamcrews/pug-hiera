class phiera::mysql { 

  class { '::mysql::server':
    root_password => '1adam12',
  }

  mysql::db { 'hiera':
    user     => 'hiera',
    password => 'supersecret',
    host     => '%',
    grant    => [ 'SELECT' ],
  }

}
