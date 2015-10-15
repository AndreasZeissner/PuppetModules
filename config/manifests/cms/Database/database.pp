	notify {"DATABASE SETUP" :}

	#### params ####
	$db_name = "www_mayflower_de"
	$db_user = "wordpress"
	$root_password = "root"
	$user_password = "wordpress"
	$host = "localhost"
	$sql_dump = "wordpress-dump.sql"

	class { '::mysql::server':
		root_password		=> "${root_password}", 
		override_options =>	{
			'mysqld'	=>	{
				'max_connections'	=> '1024',
			}
		}
	}
	mysql::db { "${db_name}":
		host 			=> "${host}",
		user 			=> "${db_user}",
		password 		=> "${user_password}", 
		sql 			=> "/tmp/${sql_dump}", 
		import_timeout 	=> 900,
		require			=> File["/tmp/${sql_dump}"]
	}
	file { "/tmp/${sql_dump}":
		ensure		=> present,
		source		=> "puppet:///modules/mysql/${sql_dump}",
	}
	mysql_grant { "${db_name}@${host}/${db_name}.users":
		ensure 		=> present, 
		options 	=> ['GRANT'],
		privileges 	=> ['ALL'], 
		table 		=> ["${db_name}.users"], 
		user 		=> ["${db_name}@${host}"]
	}
