
Create a systemd service

`sudo vim /etc/systemd/system/nasir-springboot.service`


---
```bash
[Unit]
Description=Manage Java service

[Service]
WorkingDirectory=/home/nasir/spring-boot
ExecStart=/home/nasir/.sdkman/candidates/java/current/bin/java -Dspring.config.location=application.properties -jar spring-boot-work-0.0.2-SNAPSHOT_2.jar

User=root
Type=simple
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```
---
#python service for GPU with 

```bash
[Unit]
Description=Manage Python service anaconda3

[Service]
# Set the working directory
WorkingDirectory=/home/master/OCR_Project

# Command to run the Python script with the activated conda environment
ExecStart=/bin/bash -c 'source /home/master/anaconda3/etc/profile.d/conda.sh && conda activate ocr && python /home/master/OCR_Project/app.py'


User=master
Type=simple
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```