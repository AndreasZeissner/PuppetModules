# Install rbenv
class ruby::rbenv {
  include ruby::build

  exec { 'install-rbenv':
    cwd     => '/home/ubuntu',
    user    => 'ubuntu',
    command => '/usr/bin/git clone git://github.com/sstephenson/rbenv.git .rbenv',
    creates => '/home/ubuntu/.rbenv/bin/rbenv',
    require => [Package['git-core'],Exec['install-ruby-build']],
  }

  file { '/home/ubuntu/.bashrc':
    source => 'puppet:///modules/ruby/rbenv-bashrc',
  }
}
