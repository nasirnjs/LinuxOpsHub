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
head/tail: Display the beginning or end of a file.
nano/vi: Text editors for creating and editing files.
grep: Search for text in files.
find: Search for files and directories.
ps: List running processes.
kill: Terminate processes.
top/htop: Monitor system performance and processes.
df: Display disk space usage.
du: Display directory space usage.

List of directories in the current directory along with their sizes.\
`du -h --max-depth=1 | awk '{ print $1 "\t" $2 }' | grep -E '^[0-9.]+[MG]?\s'`

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
which: Locate a program file in the user's path.
grep: Search for text in files.
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
file: Determine file type.
```