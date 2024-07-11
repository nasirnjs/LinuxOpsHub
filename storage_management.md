# Storage Management In Linux

**How the disk is divided into partitions and how the information about these partitions is stored?**\
MBR (Master Boot Record) and GPT (GUID Partition Table) are two different partitioning schemes used to organize and manage data on storage devices, particularly on hard disk drives (HDDs) and solid-state drives (SSDs).


## Add a New Disk to your existing LVM 

- Partition the new drive (if necessary): If sdb is not already partitioned, you need to create a new partition on it.

- Create a physical volume (PV): Initialize the new partition or the whole disk as a physical volume for LVM.

- Extend the volume group (VG): Add the new physical volume to your existing volume group.

- Extend the logical volumes (LVs): Expand your logical volumes to use the new space.

**Steps to Extend an LVM Partition and Filesystem**

**Steps 1:** List Block Devices\
`sudo lsblk`

**Steps 2:** Open Disk for Partitioning\
`sudo fdisk /dev/sdb`

**Steps 3:** List Partitions on the Disk\
`sudo fdisk -l /dev/sdb`

**Steps 4:** Initialize a Partition as a Physical Volume\
`sudo pvcreate /dev/sdb1`

**Steps 5:** Display Information About Volume Groups\
`sudo vgdisplay`

**Steps 6:** Display Information About Physical Volumes\
`sudo pvdisplay`

**Steps 7:** Extend an Existing Volume Group\
`sudo vgextend vg0 /dev/sdb1`

**Steps 8:** Display Information About Logical Volumes\
`sudo lvdisplay`

**Steps 9:** Display Disk Usage\
`sudo df -h`

**Steps 10:** Extend a Logical Volume\
`sudo lvextend -l +100%FREE /dev/mapper/vg0-lv--0`

**Steps 11:** Resize the Filesystem on the Logical Volume\
`sudo resize2fs /dev/mapper/vg0-lv--0`

**Steps 12:** Display Disk Usage (Again)\
    `sudo df -h`

**Summary of Steps**
- View Current Block Devices: Identify current disk and partition layout.
- Partition the Disk: Use fdisk to partition the new disk (/dev/sdb).
- Initialize the Partition for LVM: Set up the new partition (/dev/sdb1) as a physical volume.
- Check LVM Configuration: Ensure current volume groups and physical volumes are correctly set up.
- Add New PV to VG: Extend the volume group vg0 to include the new physical volume.
- Extend Logical Volume: Increase the size of an existing logical volume to utilize the new space.
- Resize Filesystem: Adjust the filesystem on the logical volume to take advantage of the extended space.
- Verify Changes: Confirm that the disk space has been correctly extended and allocated.

## Without LVM setting up and mounting a new disk into Ubuntu

**Steps 1:** List block devices before partitioning (sudo lsblk).\
`sudo lsblk`

**Steps 2:** Partition the disk (sudo fdisk /dev/sdb).\
`sudo fdisk /dev/sdb`

**Steps 3:** List block devices after partitioning (sudo lsblk).\
`sudo lsblk`

**Steps 4:** Format the partition (sudo mkfs.ext4 /dev/sdb1).\
`sudo mkfs.ext4 /dev/sdb1`

**Steps 5:** Create a mount point (sudo mkdir /mnt/sdb_mount).\
`sudo mkdir /mnt/sdb_mount`

**Steps 6:** Mount the partition (sudo mount /dev/sdb1 /mnt/sdb_mount).\
`sudo mount /dev/sdb1 /mnt/sdb_mount`

**Steps 7:** Verify the mount (df -h /mnt/sdb_mount).\
`df -h /mnt/sdb_mount`

**Steps 8:** Get filesystem attributes and UUID (Universally Unique Identifier) \
`sudo blkid /dev/sdb1`

**Steps 9:** Add entry to /etc/fstab\
Edit /etc/fstab using a text editor (sudo vim /etc/fstab) and add the following line at the end.\
`UUID=c9516c06-7a49-441d-b1cb-6cc3db593217 /mnt/sdb_mount ext4 defaults 0 0`

**Steps 10:** Mount all entries in /etc/fstab (sudo mount -a).\
`sudo mount -a`

**Steps 11:** Verify the mount after adding to /etc/fstab (df -h /mnt/sdb_mount).\
`df -h /mnt/sdb_mount`

