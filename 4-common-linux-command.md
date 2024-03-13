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
less/more: View a file one page at a time.
nano/vi: Text editors for creating and editing files.
ps: List running processes.
kill: Terminate processes.
top/htop: Monitor system performance and processes.
df: Display disk space usage.
du: Display directory space usage.
ifconfig/ip: Configure and display network interfaces.
ping: Check network connectivity.
ssh: Securely log in to remote machines.
scp: Securely copy files between machines.
wget/curl: Download files from the internet.
tar: Archive and extract files.
apt/apt-get: Package management commands for installing, updating, and removing software packages.
dpkg: Debian package management (lower-level package handling).
sudo: Execute commands with superuser privileges.
history: View command history.
chmod: Change file permissions (read, write, execute) for files and directories.
chown: Change file ownership.
chgrp: Change group ownership of files.
free: Display system memory usage.
lsblk: List block devices and their details.
mount/umount: Mount and unmount filesystems.
passwd: Change user password.
useradd/userdel: Add or delete user accounts.
groupadd/groupdel: Add or delete user groups.
crontab: Schedule tasks to run at specified times.
date: Display or set the system date and time.
hostname: Display or set the system hostname.
shutdown/reboot: Shutdown or restart the system.
uname: Display system information.
sed: Stream editor for text manipulation.
awk: Text processing tool for extracting and manipulating data.
ln: Create links (hard and symbolic) to files.
scp: Securely copy files between machines.
rsync: Synchronize files and directories between systems.
aptitude: An alternative to APT package management.
netstat/ss: Network statistics and socket information.
lsof: List open files and processes.
shutdown: Shutdown or restart the system.
diff: Compare and find differences between files.
man: Display manual pages for commands.
```




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

The file command in Linux is used to determine the type.\
`file package.json`

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


Capture packets on a specific interface.\
`sudo tcpdump -i eth0`

Capture packets with a specific protocol.\
`sudo tcpdump -i any tcp`

Capture packets with a specific source or destination IP & port numbers using the src port and dst port.\
`sudo tcpdump -i any src 192.168.1.10`

Capture packets with specific port numbers.\
`sudo tcpdump -i any port 443`



