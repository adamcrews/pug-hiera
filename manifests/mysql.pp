class phiera::mysql { 

  $opts = {
    'mysqld'       => {
      bind_address => $::ipaddress,
    }
  }

  class { '::mysql::server':
    root_password    => '1adam12',
    override_options => $opts,
  }

  mysql::db { 'hiera':
    user     => 'hiera',
    password => 'supersecret',
    host     => '%',
    grant    => [ 'SELECT' ],
  }

}
