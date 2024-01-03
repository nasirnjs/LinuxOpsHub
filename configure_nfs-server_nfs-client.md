# Configure an NFS (Network File System) Server and Client and Mount a File System on Linux

**What is Linux NFS Server?**\
Network File Sharing (NFS) is a protocol that allows you to share directories and files with other Linux clients over a network. Shared directories are typically created on a file server, running the NFS server component.\
Users add files to them, which are then shared with other users who have access to the folder.An NFS file share is mounted on a client machine, making it available just like folders the user created locally.

## Installed the NFS server

**Step1: Prepare the NFS Server** \
First lets install NFS server on the host machine
```
sudo apt update
sudo apt install nfs-kernel-server -y
```
Create a directory where our NFS server will serve the files.
```
sudo mkdir -p /var/k8-nfs/data
sudo chown -R nobody:nogroup /var/k8-nfs/data
sudo chmod 2777 /var/k8-nfs/data
```

Add NFS export options
```
sudo vi /etc/exports	
/var/k8-nfs/data 172.17.17.0/24(rw,sync,no_subtree_check,no_root_squash,no_all_squash)
```

**Let's break down the entry** 
-   `rw`: This allows clients to read from and write to the shared directory (read-write access)
-   `sync`: This option ensures that changes to the shared directory are immediately written to the disk. It provides a more consistent view of the shared directory but can impact performance.
-   `no_subtree_check`: This disables subtree checking. Subtree checking is a security feature that verifies whether a file is indeed in the exported tree. Disabling it can improve performance.
-   `no_root_squash`: By default, NFS maps requests from the root user on the client to the `nobody` user on the server. This option disables that behavior, allowing the root user on the client to have the same privileges as the root user on the server.
-   `no_all_squash`: Similar to `no_root_squash`, this option ensures that all users are given the same access rights on the exported directory, regardless of their UID or GID on the client.


Makes the specified directories available for NFS clients to access and restart the NFS Service
```
sudo exportfs -avr
sudo systemctl restart nfs-kernel-server
sudo systemctl enable nfs-kernel-server
sudo systemctl status nfs-kernel-server
```

**Step2: Setting Up NFS on Client Machine and Mounting an NFS Share**

Add the NFS Client Utilities to the Client Server (Server2) and Mount the File System\
Install nfs-common package using following.\
`sudo apt install nfs-common -y`

You can mount the NFS folder to a specific location on the local machine, known as a mount point. 
Create a local directory or Mount on existing directory this will be the mount point for the NFS share.

`sudo mkdir /var/nfs-mounted`

Mount the file share by running the mount command, Example.\
`sudo mount -t nfs {IP of NFS server}:{folder path on server} /var/locally-mounted`


`sudo mount -t nfs 172.17.17.200:/var/k8-nfs/data /var/nfs-mounted`

 - 172.17.17.200: NFS Server IP 
 - /var/k8-nfs/data: NFS Server Shared Directory 
 - /var/nfs-mounted : Local Server mount point of remote directory.

**Step3: Mounting NFS File Shares Permanently** 

Remote NFS directories can be automatically mounted when the local system is started. You can define this in the  /etc/fstab  file. In order to ensure an NFS file share is mounted locally on startup, you need to add a line to this file with the relevant file share details.

```
sudo vim /etc/fstab

{IP of NFS server}:{folder path on server} /var/locally-mounted nfs defaults 0 0

172.17.17.200:/var/k8-nfs/data /var/nfs-mounted nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800  0  0
```

Verify the mount.\
`sudo mount -a`

**Let's break down the NFS mount entry you provided**\
    -   `172.17.17.200:/var/k8-nfs/data`: This part specifies the IP address of the remote NFS server (192.168.20.100) and the exported directory (`/var/k8-nfs/data`) on that server.\
 **Local Mount Point:**    
    -   `/var/nfs-mounted`: This part specifies the local mount point where the NFS share will be mounted. In this example, it will be mounted at the local directory `/var/nfs-mounted`.\
**File System Type:**    
    -   `nfs`: This specifies the file system type, indicating that it's an NFS mount.\
**Mount Options:**
    -   `auto`: This option specifies that the filesystem should be automatically mounted at boot time, as specified in the `/etc/fstab` file.
    -   `nofail`: This option tells the system not to report errors if the NFS mount fails. If the NFS server is not available during boot, the system will still continue to boot rather than halting due to the failure of the NFS mount.   
    -   `noatime`: This option prevents updating the access time for each read operation on the file system, which can reduce unnecessary disk writes and potentially improve performance. 
    -   `nolock`: This option disables file locking. It is often used for NFS mounts where locking is not needed or is handled by applications.    
    -   `intr`: This allows NFS requests to be interrupted if the server goes down or cannot be reached.      
    -   `tcp`: This specifies that the NFS mount should use the TCP protocol. NFS can use either TCP or UDP, and using TCP can be more reliable in some situations.    
    -   `actimeo=1800`: This sets the attribute cache timeout for the NFS filesystem to 1800 seconds (30 minutes). This means that if attributes of a file are not re-read within this time frame, the client will re-fetch them.       
**Dump and Check Options:**
    -   `0 0`: These are the options for filesystem dumping and filesystem checking. A value of `0` indicates that the filesystem should not be backed up or checked during system boot.

**Step 4:  Adjusting the Firewall on the Host**
Use the ufw command to allow the Firewall access to the client system.
```
sudo ufw status
sudo ufw allow from 172.17.17.0/24 to any port nfs
sudo ufw enable
sudo ufw reload
```

**Step 5: Unmounting an NFS Remote Share**

If you no longer want the remote directory to be mounted on your system, you can unmount it by moving out of the share’s directory structure and unmounting.\

`sudo umount /var/k8-nfs/data`


## Uninstall NFS Server & Client
If you have installed the NFS server on your system and want to uninstall it along with the NFS client, you can use the following command on Ubuntu

```
sudo apt-get purge nfs-kernel-server nfs-common
sudo apt-get purge nfs-common
sudo apt-get autoremove
```