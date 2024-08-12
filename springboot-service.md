[Unit]
Description=Manage Java service

[Service]
WorkingDirectory=/home/aes-ml/AESL/Rajuk_Data_API
ExecStart=/home/aes-ml/.sdkman/candidates/java/current/bin/java -Dspring.config.location=application.properties -jar razuk-work-0.0.2-SNAPSHOT_2.jar

User=root
Type=simple
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target