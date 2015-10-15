# Manage Ruby via rbenv
define ruby::version() {
  include ruby::rbenv

  $version = $name
  exec { "install-ruby-${version}":
    command   => "/bin/su - ubuntu -c '/home/ubuntu/.rbenv/bin/rbenv install ${version}'",
    creates   => "/home/ubuntu/.rbenv/versions/${version}",
    require   => [Exec['install-rbenv'],
                  File['/home/ubuntu/.rbenv/version'],
                  Package['curl']],
    timeout   => 0,
  }

  file { '/home/ubuntu/.rbenv/version':
    content => $version,
    require => Exec['install-rbenv'],
  }
}
