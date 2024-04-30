# How To Install the Apache Web Server on Ubuntu 22.04
***
1. **Step 1: Installing Apache**
   Update our local package index so that we have access to the most recent package listings. Afterwards, we can install Apache.

    ```bash
    sudo apt update
    sudo apt install apache2
    sudo systemctl status apache2
    sudo systemctl enable apache2
    ```

2. **Step 2: Verify Apache Installation.**
   ```
   http://server_ip_address
   ```
  
3. **Step 3: Setting Up Server Application Root.**
   ```bash
   sudo mkdir -p /var/www/cloudopsschool.com
   ```
4. **Step 4: Create a Sample index.html Page**
   ```
   sudo vim /var/www/cloudopsschool.com/index.html
   ```
   ```
   <html>
            <head>
                <title>Welcome to XYZ Server!</title>
            </head>
            <body>
                <h1>Success! The your_domain server block is working!</h1>
            </body>
    </html>
   ```
5. **Step 5: Create a Server Block Virtual Hosts**
    ```
    sudo vim /etc/apache2/sites-available/cloudopsschool.com.conf

    ```

    ```
    <VirtualHost *:80>
        ServerAdmin webmaster@cloudopsschool.com
        ServerName cloudopsschool.com
        ServerAlias www.cloudopsschool.com
        DocumentRoot /var/www/cloudopsschool.com/

        # Customizing ErrorLog and CustomLog
        ErrorLog /var/log/apache2/nasir_error.log
        CustomLog /var/log/apache2/nasir_access.log combined
    </VirtualHost>
    ```

6. **Steps 6: Enable the File and Reload Apache.** Enable the file by creating a link from it to the sites-enabled directory, which Apache reads from during startup.
    ```bash
    sudo a2ensite cloudopsschool.com.conf
    sudo systemctl reload apache2
    ```

7. **Steps 7: Test and Restart Apache**. Test to make sure that there are no syntax errors in any of your Apache files and restart the server.
    ```bash
    sudo apache2ctl configtest
    sudo apachectl -k graceful
    sudo systemctl restart apache2
    ```

8. **Steps 7: Additional Configuration**

- Insert A & CNAME records in your domain and Server Public IP
- Adjusting your Firewall
- Other Apache2 custom configurations; this is a very basic configuration.
  
    **All Done!!!!!!!!! 🚀💥**


 


