exec { 'install-httperf':
  cwd     => '/root',
  command => '/usr/bin/wget https://httperf.googlecode.com/files/httperf-0.9.0.tar.gz && /bin/tar xvzf httperf-0.9.0.tar.gz && cd httperf-0.9.0 && ./configure && make all && make install',
  creates => '/usr/local/bin/httperf',
  timeout => 0,
}
