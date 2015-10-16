# Manage Fog and EC2 boot scripts
class fog {
  package { ['libxml2-dev','libxslt1-dev']: ensure => installed }

  package { 'fog':
    ensure   => installed,
    provider => gem,
    require  => [Package['libxml2-dev'],Package['libxslt1-dev']],
  }

  file { '/usr/local/bin/boot-ec2':
    source => 'puppet:///modules/fog/boot-ec2.rb',
    mode   => '0755',
  }

  file { '/usr/local/bin/bootstrap-ec2':
    source => 'puppet:///modules/fog/bootstrap-ec2.sh',
    mode   => '0755',
  }
}
