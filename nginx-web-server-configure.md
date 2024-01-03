# How To Install Nginx on Ubuntu 20.04 & 22.04

 1. Step 1: Installing Nginx
 Update our local package index so that we have access to the most recent package listings. Afterwards, we can install `nginx`.
	```
	sudo apt update
	sudo apt install nginx
	sudo systemctl status nginx
	sudo systemctl enable nginx
	```
2. Step 2: Setting Up Server application root.\
`sudo mkdir -p /var/www/nasir.xyz`

3. Step 3: Create a sample index.html page using `vim` or your favorite editor and write some HTML tag.\
`vim /var/www/nasir.xyz/index.html`
	```
	<html>
	    <head>
	        <title>Welcome to XYZ Server!</title>
	    </head>
	    <body>
	        <h1>Success!  The nasir.xyz server block is working!</h1>
	    </body>
	</html>
	```
4. Steps 4: Create a server block with the correct directives. Instead of modifying the default configuration file directly.\
` sudo vim /etc/nginx/sites-available/nasir.xyz`
	```
	### Add this into nasir.xyz
	#
	server {
		 listen 80;
		 listen [::]:80;
		 
		 root /var/www/nasir.xyz;

		 # Add index.php to the list if you are using PHP

		 index index.html index.htm index.php;

		 server_name nasir.xyz www.nasir.xyz;

		 access_log /var/log/nginx/nasir.xyz.access.log;
		 error_log /var/log/nginx/nasir.xyz.error.log;

		 location ~ \.php$ {
			include snippets/fastcgi-php.conf;
			fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
		 }
		 location / {
			#limit_conn concurrent 5;
			#limit_req zone=mylimit burst=5 nodelay;
			try_files $uri $uri/ /index.php?$args;
		 }
		  
		 #Client Side Cashing Configuration
		 location ~* \.(js|jpg|jpeg|gif|png|css|tgz|gz|rar|bz2|doc|pdf|ppt|tar|wav|bmp|rtf|swf|ico|flv|txt|woff|woff2|svg)$ {
		 expires 90d;
		 add_header Pragma public;
		 add_header Cache-Control public;
		 add_header Vary Accept-Encoding;
		 }
		 location @/ {
		 rewrite ^/(.+)$ /index.php?_route_=$1 last;
		 }
		 # Block a single IP address
		 #deny 103.120.35.2;
		 location ~ /\.env {
		 deny all;
		 }
		 location ~ /\. {
		 deny all;
		 }
	}

	```
5. Steps 5: Enable the file by creating a link from it to the `sites-enabled` directory, which Nginx reads from during startup.\
\
	`sudo ln -s /etc/nginx/sites-available/nasir.xyz /etc/nginx/sites-enabled/`

6. Steps 6: Test to make sure that there are no syntax errors in any of your Nginx files and restart server.
	```
	sudo nginx -t
	sudo nginx -s reload
	sudo systemctl restart nginx
	```
7. Steps 7: 

	- Insert A & CNAME record in your **domain** and Server **Public IP**
	- Adjusting your Firewall
	- Adjust Other Nginx custom configuration, this is very basic configuration.

	All done!!!!!!!!! 🚀💥
