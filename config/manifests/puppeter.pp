node 'puppeter.dev' {
	$dbName = "mayflower"

	class { '::mysql::server':
		root_password		=> 'root', 
		override_options =>	{
			'mysqld'	=>	{
				'max_connections'	=> '1024',
			}
		}
	}
	mysql::db { "${dbName}":
		host 		=> 'localhost',
		user 		=> "${dbName}",
		password 	=> 'root', 
		sql 		=> '/tmp/wordpress.sql', 
		require		=> File['/tmp/wordpress.sql']
	}
	file { '/tmp/wordpress.sql':
		ensure		=> present,
		source		=> 'puppet:///modules/mysql/wordpress.sql',
	}
	mysql_grant { "${dbName}@localhost/${dbName}.users":
		ensure 		=> present, 
		options 	=> ['GRANT'],
		privileges 	=> ['ALL'], 
		table 		=> ["${dbName}.users"], 
		user 		=> ["${dbName}@localhost"]
	}
}

