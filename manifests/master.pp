class phiera::master { 

  class { '::mysql::client': }

  package { 'hiera-mysql':
    ensure   => present,
    provider => pe_gem,
  }

  file { $settings::hiera_config:
    ensure  => file,
    source  => "puppet:///modules/${module_name}/hiera.yaml",
    require => Package['hiera-mysql'],
    notify  => Service['pe-httpd'],
  }

}
