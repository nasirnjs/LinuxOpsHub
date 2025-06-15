# Nginx Configuration for application Laravel App (Behind Cloudflare)

This configuration is set up to serve a Laravel application (`application`) via Nginx, with HTTPS redirection handled using Cloudflare's `X-Forwarded-Proto` header. It also includes caching for static files and blocking for sensitive files.

## Configuration

```bash
server {
    listen 80;
    server_name 192.168.61.74;
    index index.php index.html;
    
    root /var/www/application/public;

    error_log  /var/log/nginx/app.com.error.log;
    access_log /var/log/nginx/app.com.access.log;

    # Redirect HTTP to HTTPS if behind Cloudflare
    if ($http_x_forwarded_proto = "http") {
        return 301 https://$host$request_uri;
    }

    # Detect HTTPS via Cloudflare
    set $forwarded_https off;
    if ($http_x_forwarded_proto = "https") {
        set $forwarded_https on;
    }

    # PHP handler (via socket)
    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;

        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;

        fastcgi_param HTTPS $forwarded_https;
        fastcgi_param HTTP_SCHEME $http_x_forwarded_proto;
    }

    # Laravel routes fallback
    location / {
        try_files $uri $uri/ /index.php?$query_string;
        gzip_static on;
    }

    # Cache static files
    location ~* \.(js|jpg|jpeg|gif|png|css|tgz|gz|rar|bz2|doc|pdf|ppt|tar|wav|bmp|rtf|swf|ico|flv|txt|woff|woff2|svg)$ {
        expires 90d;
        add_header Pragma public;
        add_header Cache-Control "public";
        add_header Vary Accept-Encoding;
    }

    # Security rules
    location ~ /\.env {
        deny all;
    }

    location ~ /\. {
        deny all;
    }
}
