# How to Install install MySQL 5.7 on Ubuntu 20.04 LTS or Ubuntu 22.04 LTS

`Since Ubuntu 20.04 used in this guide only has MySQL 8.0 in the APT repository`.

1. So download  MySQL 5.7 APT Repository and install MySQL server and client.\
`wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb`

1.1. Install MySQL 5.7 .deb repo.\
`sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb`

1.2. select Ubuntu Bionic > After that, select the MySQL Server & Cluster option. Then, select mysql-5.7 and finally select Ok

2.  Next, update the APT repository.\
`sudo apt update`\
*Note: If you encounter the "signature couldn't be verified" error like this one: NO_PUBKEY 467B942D3A79BD29, you will need to import the missing gpg key by running the following command*\
`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29`

3. Again update repository.\
`sudo apt update`

4. Check whether MySQL 5.7 repository has been successfully installed!!\
`sudo apt-cache policy mysql-server`

5. Install MySQL 5.7\
`sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*`

6. Login MySQL Server, without password.\
`sudo mysql`\
`SHOW VARIABLES LIKE 'default_authentication_plugin';`

7. Secure your MySQL root user account.\
`sudo mysql_secure_installation`

8. Login MySQL.\
`sudo mysql -u root -p`

9. Restart MySQL and check MySQL Server status\
`sudo systemctl enable mysqld.service`\
`sudo systemctl restart mysql.service`\
`sudo systemctl status mysql.service`

10. Log in to your MySQL server and Create Database, User and Grent Permission.\
`sudo mysql -u root -p`
    ```
    show databases;
    create database nasir_db;

    CREATE USER 'nasir_user'@'localhost' IDENTIFIED BY 'NEZfyFn874p+kkf';
    ALTER USER 'nasir_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NEZfyFn874p+kkf';  

    GRANT ALL ON nasir_db.* TO 'nasir_user'@'localhost';

    SELECT user,host FROM mysql.user;

    flush privileges;
    exit
    ```