# VMware Workstation Relates common issues and solutions

**To find the version of VMware Workstation that is already installed on your system**.\
`vmware-installer -l`

## VMware Workstation GCC Compiler Error
```bash
sudo apt update
sudo apt-get install build-essential linux-headers-generic
sudo apt install build-essential
```
If does not work, try second steps.

```
sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa -y
sudo apt update
sudo apt install g++-12 gcc-12
```

## VMware several modules must be compiled and loaded into the running kernel Error!!!**

```bash
git clone https://github.com/mkubecek/vmware-host-modules.git 
cd vmware-host-modules/ 
git branch -r 
git checkout workstation-16.2.5 
make 
sudo make install 
sudo /etc/init.d/vmware start
```

## Virtual ethernet failed [Ref](https://communities.vmware.com/t5/VMware-Workstation-Pro/Virtual-ethernet-failed/td-p/2906720)

`sudo vmware-modconfig --console --install-all`
