# Configuring a Host Firewall on Ubuntu using UFW
UFW, or Uncomplicated Firewall, is a simplified firewall management interface that hides the complexity of lower-level packet filtering technologies such as `iptables`

 1. Check the firewall status.\
`sudo ufw status`
2. If you receive a *UFW command not found* error, it means the firewall isn’t installed on your system. To install it, use the command below.\
`sudo apt-get install ufw`
3. Enable UFW for IPv6 also,  make sure the value of `IPV6` is `yes`. (Optional)\
`sudo nano /etc/default/ufw`
4. These rules control how to handle traffic that does not explicitly match any other rules. By default, UFW is set to deny all incoming connections and allow all outgoing connections.\
`sudo ufw default deny incoming`
`sudo ufw default allow outgoing`
5. Allowing SSH Connections from specific IP.\
`sudo ufw allow proto tcp from 116.212.111.186 to any port 5987`
6. Allowing HTTP and HTTPS Traffic from any IP.\
`sudo ufw allow proto tcp from any to any port 80,443`
7. Allowing MySQL Connections from specific IP.\
`sudo ufw allow proto tcp from 116.212.111.186 to any port 3306`
8. Specify port ranges with  some applications use multiple ports, instead of a single port.\
`sudo ufw allow 6000:6007/tcp`
`sudo ufw allow 6000:6007/udp`
9. Deleting Rules on Ubuntu Firewall.\
`sudo ufw status numbered`
`sudo ufw delete 4` 
10. Block and deny incoming connections/ports.\
`sudo ufw deny from 203.5.1.43`
`sudo ufw deny from 103.13.42.13/29`
`sudo ufw deny from 1.1.1.2 to any port 22 proto tcp`
11. Reload the ufw.\
`sudo ufw reload`
12. View the firewall logs, by default all UFW entries are logged into /var/log/ufw.log.\
`sudo more /var/log/ufw.log`
`sudo tail -f /var/log/ufw.log`
13. Enable UFW.\
`sudo ufw enable`
14. Verify status of UFW.\
`sudo ufw status`
15. Disabling UFW.\
`sudo ufw disable`
16. Delete UFW rules entirely and start over.\
`sudo ufw reset`
