# Install ruby-build
class ruby::build {
  $rb_deps = ['libruby',
              'libreadline-dev',
              'libpcre3-dev',
              'libcurl4-openssl-dev',
              'zlib1g-dev',
              'curl',
              'git-core',
              'libssl-dev',
              'build-essential']

  package { $rb_deps:
    ensure => installed,
  }

  exec { 'clone-ruby-build':
    cwd     => '/root',
    command => '/usr/bin/git clone git://github.com/sstephenson/ruby-build.git',
    creates => '/root/ruby-build',
    require => [Package['git-core'],Package[$rb_deps]],
  }

  exec { 'install-ruby-build':
    cwd     => '/root/ruby-build',
    command => '/root/ruby-build/install.sh',
    require => Exec['clone-ruby-build'],
    creates => '/usr/local/bin/ruby-build',
  }
}
