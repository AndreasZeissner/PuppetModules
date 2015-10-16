# Manage MySQL server
class mysql::server {
  $password = 'sekrit'
  $version  = 'mysql-server'

  package { $version: ensure => installed }

  service { 'mysql':
    ensure  => running,
    enable  => true,
    require => Package[$version],
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    owner   => 'mysql',
    group   => 'mysql',
    notify  => Service['mysql'],
    require => Package[$version],
  }

  exec { 'set-mysql-password':
    unless  => "/usr/bin/mysqladmin -uroot -p${password} status",
    command => "/usr/bin/mysqladmin -uroot password ${password}",
    require => Service['mysql'],
  }
}