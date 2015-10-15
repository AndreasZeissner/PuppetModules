node "puppeter.dev" {
	#include sql
	#include apache 
	#include stdlib
	class { '::mysql::server': 
		root_password		=> 'root', 
		override_options 	=> {
			'mysqld'	=> {
				'max_connections'	=> '1024'
			}
		}

	}
}