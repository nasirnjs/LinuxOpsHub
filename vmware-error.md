# VMware Workstation GCC Compiler Error
```bash
sudo apt update
sudo apt-get install build-essential linux-headers-generic
sudo apt install build-essential
```

**##VMware several modules must be compiled and loaded into the running kernel Error!!!**

```bash
git clone https://github.com/mkubecek/vmware-host-modules.git 
cd vmware-host-modules/ 
git branch -r 
git checkout workstation-16.2.5 
make 
sudo make install 
sudo /etc/init.d/vmware start
```