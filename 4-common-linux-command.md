# 🚀 The Ultimate Linux Command Cheat Sheet 🚀

```bash
ls: List files and directories in the current directory.
cd: Change the current directory.
pwd: Print the current working directory.
mkdir: Create a new directory.
rmdir: Remove an empty directory.
touch: Create an empty file.
rm: Remove files or directories.
cp: Copy files or directories.
mv: Move or rename files and directories.
cat: Display the content of a file.
nano/vi: Text editors for creating and editing files.
ps: List running processes.
kill: Terminate processes.
top/htop: Monitor system performance and processes.
df: Display disk space usage.
du: Display directory space usage.
less/more: View a file one page at a time.
wget/curl: Download files from the internet.
sudo: Execute commands with superuser privileges.
chmod: Change file permissions (read, write, execute) for files and directories.
chown: Change file ownership.
chgrp: Change group ownership of files.
free: Display system memory usage.
mount/umount: Mount and unmount filesystems.
passwd: Change user password.
useradd/userdel: Add or delete user accounts.
groupadd/groupdel: Add or delete user groups.
hostname: Display or set the system hostname.
uname: Display system information.


```
---
Display the current date and time.\
`date`

Display the date and time in a specific format.\
`date +"%d-%m-%y %H:%M:%S"`

To check the current time zone set on your system.\
`timedatectl`

To list all available time zones.\
`timedatectl list-timezones`

Display the date and time in a different time zone.\
`TZ="America/New_York" date`

To set the system's time zone, you can use the timedatectl command.\
`sudo timedatectl set-timezone Asia/Dhaka`

---
The history command in Unix-like operating systems is used to display a list of previously executed commands.\
`history`

You can also specify an optional argument to limit the number of commands displayed.\
`history 10`

You can use the history command to recall and rerun previously executed commands by referencing their command numbers.\
`!4`

---
Create a tar archive.\
`tar -cvf archive.tar /path/to/directory`

Extract files from a tar archive.\
`tar -xvf archive.tar`

Extract files to a specific directory.\
`tar -xvf archive.tar -C /path/to/destination_directory`

Create a compressed tar archive.\
`tar -cvzf archive.tar.gz /path/to/directory`

Extract files from a compressed tar archive.\
`tar -xvzf archive.tar.gz`

Create a compressed tar archive using bzip2 compression.\
`tar -cvjf archive.tar.bz2 /path/to/directory`

Extract files from a compressed tar archive using bzip2 compression.\
`tar -xvjf archive.tar.bz2`

---

Copy a file from local to remote.\
`scp -r /path/to/local/file username@remote_host:/path/to/remote/location`

Copy a file from remote to local.\
`scp -r username@remote_host:/path/to/remote/file /path/to/local/location`

Copy files with specific port and preserve file attributes.\
`scp -P 2222 -p /path/to/local/file username@remote_host:/path/to/remote/location`

Copy files from one directory to another locally.
`rsync -avr /path/to/source_directory /path/to/destination_directory`

Synchronize files between local and remote directories over SSH.\
`rsync -avz -e ssh /path/to/local_directory username@remote_host:/path/to/remote_directory`

Synchronize files from a remote server to your local machine. `-e` use to use remote shell\
`rsync -avz -e ssh nasir@172.17.18.240:/home/nasir/rsynx/k8s/ /home/nasir/Desktop/k8s-st/`

Exclude specific files or directories from synchronization.\
`rsync -avz --exclude='k8s-minikube/' -e ssh nasir@172.17.18.240:/home/nasir/rsynx/k8s/ /home/nasir/Desktop/k8s-st/`

---
The file command in Linux is used to determine the type.\
`file package.json`

The diff command is comparing file1.txt and file2.txt.\
`diff -u file1.txt file2.txt`

Display the first 10 lines of a file.\
`head file.txt`

Display a specific number of lines from the beginning of a file.
`head -n 5 file.txt`

Display the last 10 lines of a file.\
`tail file.txt`

Display a specific number of lines from the end of a file.\
`tail -n 5 file.txt`

List of directories in the current directory along with their sizes.\
`du -h --max-depth=1 | awk '{ print $1 "\t" $2 }' | grep -E '^[0-9.]+[MG]?\s'`

This is the location of the ls binary executable in the /usr/bin directory.\
`which -a ls`

This command searches for all files with the .txt extension in the directory .\
`find /path/to/search -name "*.txt"`

Search for files modified in the last 7 days.\
`find /path/to/search -type f -mtime -7`

This command performs a case-insensitive search for the specified pattern in the file.\
`grep -i "pattern" file.txt`

The man command in Linux is used to display the manual pages for various commands.\
`man vim`

---

The sed command, short for stream editor, is a powerful text manipulation tool in Unix-like operating systems.\
`sed 's/old_text/new_text/' file.txt`

To replace the word "world" with "WORLD!!!" in the output.txt file.\
`sed -i 's/world/WORLD!!!/g' output.txt`

To remove lines starting with # and modify the file directly.\
`sed -i '/^\s*#/d' filename`

---
Configure and display network interfaces.
`ifconfig`

`ifconfig eth0`

`ip a`

Check network connectivity.\
`ping www.example.com`

`ping 172.17.18.240`

To check which processes are using port 80 (HTTP).\
`netstat -tuln | grep :80`

---
To install nmap, you can use the package manager appropriate.\
`sudo apt install nmap`

Scan ports 1 through 1000 on the host with IP address 172.17.18.120.\
`nmap -p 1-10000 172.17.18.120`

Use the -p- option to scan all 65,535 TCP ports.\
`nmap -p- 192.168.1.1`

Specify the protocols to scan using the -sU option for UDP scans, -sS for TCP.\
`nmap -sU 192.168.1.1`

Specify multiple hosts to scan by providing their IP addresses or hostnames.\
`nmap 192.168.1.1 192.168.1.2 192.168.1.3`

Use the -oN option to save the scan results to a text file.\
`nmap -oN scan_results.txt 192.168.1.1`

---

Capture packets on a specific interface.\
`sudo tcpdump -i eth0`

Capture packets with a specific protocol.\
`sudo tcpdump -i any tcp`

Capture packets with a specific source or destination IP & port numbers using the src port and dst port.\
`sudo tcpdump -i any src 192.168.1.10`

Capture packets with specific port numbers.\
`sudo tcpdump -i any port 443`

---

Show you any installed packages related to Python 2.7\
`apt list --installed | grep -i python2.7`

Used to list all systemd units of type "service" currently loaded in the system.\
`systemctl list-units --type service`

Used to display lines from the /etc/services file that contain the string "ssh".\
`cat /etc/services| grep ssh`

---
Open the cron table for editing by running the following command.\
`crontab -e`

To execute your script via a cron job every 5 minutes.
`*/5 * * * * /home/nasir/rsync/script.sh >/dev/null 2>&1`

Explanation:
- `>/dev/null` Redirects the standard output (stdout) of the script to /dev/null, discarding any output.
- `2>&1` Redirects the standard error (stderr) to the same location as the standard output, which in this case is /dev/null.

---

 Here's a list of commands for shutting down and rebooting a Linux system.\
 ```bash
#This command halts the system, bringing it to a complete stop
init 0 

# Halt the system immediately
sudo halt

# Log out all users and then halt the system
sudo shutdown -h now

# Shutdown immediately
sudo shutdown -h now

# Restart immediately
sudo shutdown -r now

# Shutdown at a specific time (e.g., 10 minutes from now)
sudo shutdown -h +10

#System will be shutting down in 1 hour and 20 minutes.
sudo shutdown -h +1:20

# Shutdown at a specific time (e.g., 10:00 PM) with a custom message
sudo shutdown -h 22:00 "System will be shutting down for maintenance at 10:00 PM. Please save your work."


#This command initiates a system reboot
init 0 

# Reboot the system immediately
sudo reboot

#For immediate reboot
sudo shutdown -r now 

#System will be rebooting in 1 hour and 40 minutes.
sudo shutdown -r +1:40 "System will be rebooting in 1 hour and 40 minutes."
 ```