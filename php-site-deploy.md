<h2>  Deploy PHP applications on Ubunut 22.0.4Lts </h2>

## Deploy repo w/o dependencies

`sudo apt update`

`sudo add-apt-repository ppa:ondrej/php`

`sudo apt update`

`sudo apt-get install php7.4 php7.4-fpm php-pear php7.4-gd php7.4-dev php7.4-mbstring php7.4-mysql php7.4-xml php7.4-mcrypt -y`

`sudo apt-get install php7.4-zip php7.4-curl php7.4-imap php7.4-gd php7.4-xmlrpc php7.4-xml php7.4-zip php7.4-bcmath -y`

`update-alternatives --config php`

`sudo php-fpm7.4 -t`

`sudo systemctl restart php7.4-fpm.service`


`sudo apt-get install php8.2 php8.2-fpm php8.2-bcmath php8.2-cli php8.2-curl php8.2-gd php8.2-mbstring php8.2-mysql php8.2-common php8.2-opcache php8.2-xml php8.2-zip`

`update-alternatives --config php`

`sudo php-fpm8.2 -t`

`sudo systemctl restart php8.2-fpm.service`

Use the --list option to list all available alternatives PHP.\
`update-alternatives --list php`

Select specific Php Version\
`update-alternatives --config php`

Run the following command to set PHP 8.0 as the default version.\
`update-alternatives --set php /usr/bin/php8.0`

## Install Composer
[Composer-Install](https://getcomposer.org/download)



## Login Database and Create DB,User,Import DB
```shell
show databases;
create database tradelicense;
CREATE USER 'tradelicense_user'@'localhost' IDENTIFIED BY 'strong4#Password';
ALTER USER 'tradelicense_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'strong4#Password';  
GRANT ALL PRIVILEGES ON tradelicense.* TO 'tradelicense_user'@'localhost';
SELECT user,host FROM mysql.user;
flush privileges;
exit
```


## PHP sockets Tuning
```bash
vim /etc/php/7.4/fpm/pool.d/www.conf

#Add Following Values

pm = dynamic
pm.max_children = 50
pm.start_servers = 10
pm.min_spare_servers = 10
pm.max_spare_servers = 20
```
`sudo php-fpm7.4 -t`

`systemctl restart php7.4-fpm`

[PHP-FPM-Tunning References](https://spot13.com/pmcalculator/)
