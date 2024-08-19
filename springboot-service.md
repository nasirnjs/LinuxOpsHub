
Create a systemd service

`vim /etc/systemd/system/nasir-springboot.service`


---
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