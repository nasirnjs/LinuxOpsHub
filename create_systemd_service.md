# Create Systemd Service


1. Enter into Linux systemd service directory and create a servie files.
```
cd /etc/systemd/system
vim lendingapp.service
```
Past following line and chnage as per your project requirement and save out.

```
[Unit]
Description=Lending_application

[Service]
Type=simple
Restart=always

StandardOutput=append:/var/log/lendingapp.service.log
StandardError=append:/var/log/lendingapp.service.error.log

User=root
Group=www-data

#Project root path
WorkingDirectory=/var/www/lending_portal/

#Command should be execute
ExecStart=/usr/bin/npm start

[Install]
WantedBy=multi-user.target
```

2. Reload the service files to include the new service. \
`sudo systemctl daemon-reload`

3. Start your service \
`sudo systemctl start lendingapp.service`

4. To check the status of your service \
`sudo systemctl status lendingapp.service`

5. To enable your service on every reboot \
`sudo systemctl enable lendingapp.service`

6. If you want to disable your service \
`sudo systemctl disable lendingapp.service`
