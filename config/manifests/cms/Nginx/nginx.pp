notify{"NGINX SETUP" :}
	class {'nginx':}

	nginx::resource::vhost { 'dev.mayflower.de': 
		www_root	=> "/srv/www/www.mayflower.de/htdocs/"
	}


	#nginx::resource::vhost { 'wandi.example.com':
	#	www_root	=> "/var/www/wandi"
	#}
	#file { ['/var/www/', '/var/www/wandi']: 
	#	ensure	=> 'directory', 
	#	mode	=> '0755',
	#	require	=> Nginx::Resource::Vhost['wandi.example.com'], 
	#}
	#file { '/var/www/wandi/index.html': 	
	#	content	=> "<html><h1> WANDI </h1><html>",
	#	mode	=> '0644',
	#	require	=> File['/var/www/wandi']
	#}