# Setting a Static IP in Ubuntu Using Netplan

Netplan is the Ubuntu network configuration tool in all recent Ubuntu versions. Netplan is based on a YAML-based configuration system that simplifies the configuration process.

**How to Configure Static IP Address on Ubuntu 20.04**

`vim /etc/netplan/01-network-manager-all.yaml`
```
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: no
      addresses:
        - 192.168.10.250/24
      gateway4: 192.168.10.1
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]
```
`sudo netplan apply`

`ip a`
`ifconfig`

**How to Configure Static IP Address on Ubuntu 22.04**

`vim /etc/netplan/01-network-manager-all.yaml`
```shell
network:
  version: 2
  renderer: networkd
  ethernets:
    ens33:
      dhcp4: no
      addresses:
        - 192.168.10.245/24
      routes:
        - to: default
          via: 192.168.10.1
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]
```

`sudo netplan apply`


**Explanation:**

  -   `network`: The top-level keyword indicating that this is a Netplan       network configuration file.
  -   `version: 2`: Specifies the Netplan configuration syntax version.
  -   `renderer: networkd`: Specifies the network renderer to use. In this case, it's set to use `systemd-networkd`.
  -   `ethernets`: Defines Ethernet (network interface) configurations.
  -   `ens33`: The name of the Ethernet interface. You may need to adjust this based on your actual interface name.   
   -   `dhcp4: no`: Disables DHCP for IPv4 on this interface.
   -   `addresses: [192.168.10.245/24]`: Configures a static IPv4 address of `192.168.10.245` with a subnet mask of `24` (implying a    subnet mask of `255.255.255.0`).
   -   `routes`: Configures a static route.
       -   `to: default`: Specifies that this is the default route.
       -   `via: 192.168.10.1`: Specifies the gateway for the default route.
   -   `nameservers`: Configures DNS (name servers) settings.
       -   `addresses: [8.8.8.8, 8.8.4.4]`: Sets Google's public DNS servers (`8.8.8.8` and `8.8.4.4`) as the DNS servers to be used.
