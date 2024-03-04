
<h2>How to Install and Configure SSH on Ubuntu 22.04</h2>

**Table of Contens**
- [SSH (Secure Shell) Server!](#ssh-secure-shell-server)
- [Steps 1:  Install SSH on Ubuntu](#steps-1--install-ssh-on-ubuntu)
- [Steps 2: Start and Enable SSH Service](#steps-2-start-and-enable-ssh-service)
- [Steps 3: Configure custom SSH port](#steps-3-configure-custom-ssh-port)
- [Steps 4: Allowing SSH through the firewall](#steps-4-allowing-ssh-through-the-firewall)
- [Steps 5: Connecting to the remote system from your local machine](#steps-5-connecting-to-the-remote-system-from-your-local-machine)
- [Steps 6: Enable,Disable or Status check](#steps-6-enabledisable-or-status-check)

## SSH (Secure Shell) Server!
SSH is a network protocol that provides a secure connection between a client and a server. All communication is encrypted, preventing theft of data transmitted over the network and other remote network attacks.
Commonly used in UNIX-like systems, SSH servers authenticate users and ensure secure communication.

## Steps 1:  Install SSH on Ubuntu
OpenSSH is not pre-installed on the system, so let's install it manually. To do this, type in the terminal update packages to the latest versions and install `openssh-server` package.
```bash
sudo apt update
sudo apt install openssh-server
```

## Steps 2: Start and Enable SSH Service
Verify that the service is running successfully, and enable service.
```bash
sudo systemctl status ssh
sudo systemctl enable --now ssh
```

## Steps 3: Configure custom SSH port
The default SSH port is 22 and most of the attack scripts check are written around this port only. Changing the default SSH port should add an additional security layer because the number of attacks (coming to port 22) may reduce.\

** Before making any changes to configuration files, it's always a good practice to back them up.** 

`sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config_back`

`sudo vim /etc/ssh/sshd_config`

**Let’s see what steps you can take to secure your SSH server.**

1. Disable empty passwords `PermitEmptyPasswords no`
2. Change default SSH ports `Port 2345`
3. Disable root login via SSH `PermitRootLogin no`
4. Configure idle timeout interval `ClientAliveInterval 300`
5. Disable ssh protocol 1 `Protocol 2`
6. Allow SSH access to selected users only `AllowUsers User1 User2`
7. Disable password based SSH login


## Steps 4: Allowing SSH through the firewall
Ubuntu comes with a firewall utility called UFW (UncomplicatedFirewall) which is an interface for iptables that in turn manages the network’s rules. If the firewall is active, it may prevent the connection to your SSH Server.
To configure UFW so that it allows the wanted access, you need to run the following command.

`sudo ufw allow from any to any port 2222 proto tcp`

After making all the changes in the main configuration file, save them and close the editor. Restart the service to make the changes take effect.

`sudo systemctl restart ssh`

## Steps 5: Connecting to the remote system from your local machine
Your local Linux system should already have an SSH client installed. If not, you may always install it using the following command on Ubuntu.

`sudo apt install openssh-client`

To connect to your Ubuntu system you need to know the IP address of the computer and use the ssh command.

`ssh username@IPaddress `\
`ssh nasir@172.17.18.200`

`ssh username@IPaddress -p portnumber`\
`ssh nasir@172.17.18.200 -p 22`

## Steps 6: Enable,Disable or Status check
Your commands to manage the SSH service are correct, but the service command is being used alongside systemctl. It's preferable to stick with one of them for consistency. Since Ubuntu 22.04 uses systemd, it's recommended to use systemctl for managing services.
```bash
sudo systemctl status ssh
sudo systemctl stop ssh
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl disable ssh
```
