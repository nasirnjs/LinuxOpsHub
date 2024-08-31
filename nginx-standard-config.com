##
# Default server configuration
#
server {
	
        # SSL configuration
        #listen 80;
        # listen [::]:443 ssl default_server;

        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.php;

        server_name eshosting.com www.eshosting.com;

	access_log /var/log/nginx/eshosting.com.access.log;
	error_log /var/log/nginx/eshosting.com.error.log;

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

    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/www.eshosting.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/www.eshosting.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

}

server {
    if ($host = www.eshosting.com) {
        return 301 https://$host$request_uri;
    } 


    if ($host = eshosting.com) {
        return 301 https://$host$request_uri;
    } 

        server_name eshosting.com www.eshosting.com;
    listen 80;
    return 404;

}


