<h2> Automating MySQL Database Backups with Cron <h2>

- [Steps 1. Create MySQL Configuration File](#steps-1-create-mysql-configuration-file)
- [Steps 2.  Create Backup Script](#steps-2--create-backup-script)
- [Steps 3.  Assign execute permission on Backup Script](#steps-3--assign-execute-permission-on-backup-script)
- [Steps 4. Schedule Script with CronTab](#steps-4-schedule-script-with-crontab)


## Steps 1. Create MySQL Configuration File

Create a MySQL configuration file named `.mysql.cnf` in `/root/script/`:

`vim /root/script/.mysql.cnf`
```bash
[mysqldump]
user=root
password=solu546242CST
```

## Steps 2.  Create Backup Script

`vim /root/script/pmi-db.sh`

```bash
#!/bin/bash

# Perform MySQL database backup
mysqldump --defaults-extra-file=/root/script/.mysql.cnf --triggers --routines --events --no-tablespaces --default-character-set=utf8 --no-create-db pmisdb | gzip > /root/db-backup/pmisdb_`date +\%Y-\%m-\%d-\%H.\%M.\%S`.sql.gz

echo "PMI DB Backup Done"

echo "jobs DB Backup Started"

mysqldump --defaults-extra-file=/root/script/.mysql.cnf --triggers --routines --events --no-tablespaces --default-character-set=utf8 --no-create-db jobsdb | gzip > /root/db-backup/jobsdb_`date +%Y-%m-%d-%H.%M.%S`.sql.gz

echo "Jobs DB backup Done"
# Change to the backup directory
cd /root/db-backup

# Delete files older than 10 days
find . -name 'pmisdb_*.sql.gz' -type f -mtime +10 -exec rm {} \;

echo "Backup Done and Deleted Databases Older then 10 Days"

```

## Steps 3.  Assign execute permission on Backup Script
`chmod +x /root/script/pmi-db.sh`


## Steps 4. Schedule Script with CronTab

`crontab -e`

`0 2 * * * /bin/bash /root/script/pmi-db.sh >/dev/null 2>&1`


**All Done**

