node 'puppeter.dev' {
	class { '::mysql::server':
		root_password		=> 'root', 
		override_options =>	{
			'mysqld'	=>	{
				'max_connections'	=> '1024',
			}
		}

	}
	mysql::db { 'wordpress':
		host 		=> 'localhost',
		user 		=> 'wordpress',
		password 	=> 'root', 
		sql 		=> '/tmp/wordpress.sql', 
		require		=> File['/tmp/wordpress.sql']
	}
	file { '/tmp/wordpress.sql':
		ensure		=> present,
		source		=> 'puppet:///modules/mysql/wordpress.sql',
	}
	mysql_grant { 'wordpress@localhost/wordpress.users':
		ensure 		=> present, 
		options 	=> ['GRANT'],
		privileges 	=> ['ALL'], 
		table 		=> ['wordpress.users'], 
		user 		=> ['wordpress@localhost']
	}
}
