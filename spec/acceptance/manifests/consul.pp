
package{'ruby-devel':
  ensure => 'installed',
} ->


package{'diplomat':
  ensure   => 'installed',
  provider => 'gem',
}->

class { 'consul':
  config_hash => {
      'data_dir'         => '/opt/consul',
      'log_level'        => 'INFO',
      'bootstrap'        => true,
      'bootstrap-expect' => 1,
      'server'           => true
  }
}

consul::service { 'redis':
  tags           => ['master'],
  port           => 8000,
}