node 'puppeter.dev' {
	include ::php
	import "Database/database.pp"
	import "Nginx/nginx.pp"
}

