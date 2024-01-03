server {
    server_name nasir.wiki www.nasir.wiki;  # Replace with your domain or IP address

    access_log /var/log/nginx/nasir.wiki.access.log;
    error_log /var/log/nginx/nasir.wiki.error.log;

    location / {
	#limit_req zone=mylimit burst=30 nodelay;
    #limit_conn concurrent 5;
        proxy_pass http://localhost:5000;  # Replace with your backend server's address
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }


    # Location block to handle the redirect
    #location /gulfstream {
    #    return 301 https://xyz.com/;
    #}

    location ~ /\.env {
	deny all;
    }

    location ~ /\. {
     	deny all;
    }


    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/nasir.wiki/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/nasir.wiki/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

}

server {
    if ($host = www.nasir.wiki) {
        return 301 https://$host$request_uri;
    }


    if ($host = nasir.wiki) {
        return 301 https://$host$request_uri;
    }

    listen 80;
    server_name nasir.wiki www.nasir.wiki;
    return 404;

}

