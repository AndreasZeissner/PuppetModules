# == Class: apache
#
# Full description of class apache here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'apache':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class apache {

	# THIS IS CRAP!
	# But Service requires Package! 
	# Conf file notifys Service!
	service { 'apache2':
		enable      => true,
		ensure      => running,
		#hasrestart => true,
		#hasstatus  => true,
		require		=> Package["apache2"],
	}
	package { 'apache2':
		ensure => installed,
	}
	file { '/etc/apache2/cookbook.conf':
		content		=> "<VirtualHost *:80> \nServerName cookbook\nDocumentRoot /var/www/cookbook \n</VirtualHost>", 
		require		=> Package["apache2"],
		notify		=> Service["apache2"]
	}
	file { ['/var/www', '/var/www/cookbook']: 
		ensure 		=> directory,
	}
	file { '/var/www/cookbook/index.html': 
		content		=> "<html><h1> HALLO WELT </h1></html>", 
		require		=> File["/var/www/cookbook"]
	}
	$interface = {
		'name'	=> 'Käse', 
		'ip'	=> '192.168.100.1'
	}
	notify {"${interface['name']}":}
}
