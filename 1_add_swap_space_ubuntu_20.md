## Adding swap space on Ubuntu 20.04 can be done using the following steps:

1. Check the current swap space status by running the following command. \
`sudo swapon --show`

This will show you the current swap space usage on your system.

2. Create a swap file by running the following command: \
`sudo fallocate -l 2G /swapfile`

This will create a 2GB swap file. You can adjust the size to your needs. \

3. Set the correct permissions on the swap file by running the following command. \
`sudo chmod 600 /swapfile`

4. Set up the swap file by running the following command. \
`sudo mkswap /swapfile`

5. Enable the swap file by running the following command. \
`sudo swapon /swapfile`

This will enable the swap file for immediate use.

6. Verify the swap space usage again by running the following command. \
`sudo swapon --show`

You should see the new swap file listed. \

7. Make the swap file permanent by adding it to the /etc/fstab file. \
`echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab`

This will add an entry to the /etc/fstab file that will automatically enable the swap file at boot time.

And that's it! You have successfully added swap space to your Ubuntu 20.04 system.

[Referance](https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04)



Increase the existing swap (i.e /swapfile) size by 1GB.
```
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024 oflag=append conv=notrunc
sudo swapoff /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```


