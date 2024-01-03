# Linux User and Group Management & Permission Cheat Sheet
**List covers a comprehensive set of user-related commands, covering user creation, modification, and management.\
It includes changing user details, modifying usernames, managing home directories, granting sudo privileges, displaying user information, locking and unlocking accounts, changing passwords, and removing users.\
Additionally, included commands for forcing password changes on the next login, setting expiration dates for user accounts, and checking login history.**

### User management in Linux
```
#Create a new user
sudo adduser john
# List all user on the system
cat /etc/passw
#create a user without a home directory in Linux
sudo adduser --no-create-home username
#Change user details
sudo usermod -c "New Full Name" username
#Change the username
sudo usermod -l new_username old_username
#Change the user's home directory:
sudo usermod -d /new/home/directory username
#Grant sudo privileges to the user
sudo usermod -aG sudo john
#Display user information
finger username
#Display information about a user or group, including their user ID and group membership
id username
#Lock the user account
sudo passwd -l john
#Unlock the user account
sudo passwd -u john
#Change User Password
sudo passwd username
#Change user password
sudo passwd john
#Remove the user
sudo deluser john
#Remove user together with his/her home directory
sudo deluser --remove-home user
#Force a user to change password on next login
sudo chage -d 0 username
#Set an expiration date for a user account
sudo usermod --expiredate 2023-12-31 username
#Check a user's login history
last username
```
### Group Management in Linux
```
#Create a New Group
sudo addgroup group_name
# List all groups on the system
cat /etc/group
#Add a User to a Group
sudo adduser username group_name
#Change the name of a group
sudo groupmod -n new_group_name old_group_name
#Remove a User from a Group
sudo deluser username group_name
# Remove a user from a group
sudo gpasswd -d username group_name
#Display Group Members
getent group group_name
#Remove a Group
sudo delgroup group_name
#Changing a user's supplementary groups allows you to manage the additional groups
sudo usermod -aG group1 username
sudo usermod -aG group1,group2 username
# Assign a specific GID when creating a new group
sudo addgroup --gid 1001 new_group_name
# Change the GID of an existing group
sudo groupmod --gid new_gid group_name
```

**sudo (Superuser Do)**:\
sudo (Superuser Do)` is a command-line utility in Unix and Unix-like operating systems that allows permitted users to execute a command as the superuser or another user, as specified by the security policy.\
**In simpler terms:**\
**Superuser:** The superuser, often abbreviated as *root*, is a special user with administrative privileges. The superuser has the ability to execute any command, modify any file, and perform any system task.\
**sudo Command:** The *sudo* command allows a permitted user to execute a command as the superuser or another user, according to the security policy configured in the */etc/sudoers* file.

**Key Concepts:**\
**Root Privileges:** Users granted sudo privileges can perform actions that would normally require root (administrative) privileges.\
**Security Policy:** The security policy for sudo is defined in the */etc/sudoers* file. This file specifies which users or groups are allowed to run which commands as the superuser.

### Managing Sudo User Permissions
#Adding a User to the sudo Group\
`sudo usermod -aG sudo username`

#Editing the sudoers File
`/etc/sudoers`
or\
`sudo visudo`
```
#Specifies that the user can run any command without entering a password
username ALL=(ALL) NOPASSWD: ALL
#Allow a User to Run a Custom Script
username ALL=(ALL) NOPASSWD: /path/to/custom/script.sh
Add the following line to allow the user to restart nginx without a password
username ALL=(ALL) NOPASSWD: /etc/init.d/nginx restart
```

## Understanding Linux File Permissions
Each file and directory has three user based permission groups:
owner – The Owner permissions apply only to the owner of the file or directory, they will not impact the actions of other users.
group – The Group permissions apply only to the group that has been assigned to the file or directory, they will not affect the actions of other users.
all users – The All Users permissions apply to all other users on the system, this is the permission group that you want to watch the most.
Permission Types

| Permission Group | Meaning               |
|-------------------|-----------------------|
| `u`               | Owner                 |
| `g`               | Group                 |
| `o`               | Others                |
| `a`               | All users             |

Permission Types
Each file or directory has three basic permission types:

- **read** - **r** – The Read permission refers to a user’s capability to read the contents of the file.
- **write** - **w** – The Write permissions refer to a user’s capability to write or modify a file or directory.
- **execute** - **x** – The Execute permission affects a user’s capability to execute a file or view the contents of a directory.

Using Binary References to Set permissions
| Binary Reference | Meaning |
|------------------|---------|
| `4`              | Read    |
| `2`              | Write   |
| `1`              | Execute |

- 4 represents read permission.
- 2 represents write permission.
- 1 represents execute permission.

For example, the octal value 764 can be broken down as follows:

- 7 (Owner): Read (4) + Write (2) + Execute (1)
- 6 (Group): Read (4) + Write (2)
- 4 (Others): Read (4)

![Permission Details](/image/linux-permission-details.png)
![Permission ](/image/linux-permission-details.png)
