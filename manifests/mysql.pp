class phiera::mysql { 

  $users = {
    'hiera@%' => {
      ensure        => present,
      password_hash => mysql_password('suppersecret'),
    }
  }

  class { '::mysql::server':
    root_password => '1adam12',
    #    users         => $users,
  }

  mysql::db { 'hiera':
    user     => 'hiera',
    password => 'supersecret',
    host     => '%',
    grant    => [ 'SELECT' ],
  }

}
