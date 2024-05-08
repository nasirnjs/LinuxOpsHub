
`sudo apt update`

`sudo add-apt-repository ppa:ondrej/php`

`sudo apt update`


`sudo apt-get install php7.4 php7.4-fpm php-pear php7.4-gd php7.4-dev php7.4-mbstring php7.4-mysql php7.4-xml php7.4-mcrypt -y`

`sudo apt-get install php7.4-zip php7.4-curl php7.4-imap php7.4-gd php7.4-xmlrpc php7.4-xml php7.4-zip php7.4-bcmath -y`

`update-alternatives --config php`

```bash
sudo php-fpm7.4 -t
systemctl restart php7.4-fpm
```

[Composer-Install](https://getcomposer.org/download)


```shell
show databases;
create database ecomdb;
CREATE USER 'ecomdb_user'@'localhost' IDENTIFIED BY 'strong4#Password';
ALTER USER 'ecomdb_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'strong4#Password';  
GRANT ALL PRIVILEGES ON ecomdb.* TO 'ecomdb_user'@'localhost';
SELECT user,host FROM mysql.user;
flush privileges;
exit
```



Use the --list option to list all available alternatives PHP.\
`update-alternatives --list php`

Select specific Php Version
`update-alternatives --config php`

Run the following command to set PHP 8.0 as the default version.\
`update-alternatives --set php /usr/bin/php8.0`