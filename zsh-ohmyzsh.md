
# How to Install Z Shell (Zsh) and Oh My Zsh on Linux

[Installing ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

Verify current shell.\
`echo $SHELL`

Install and set up zsh as default.\
`sudo apt install zsh`

Verify installation by running.\
`zsh --version`

Make it your default shell.\
`chsh -s $(which zsh)`

Now Install Oh My Zsh [Reference](https://ohmyz.sh/#install).\
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Add Autosuggestion.\
[Install autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
vim ~/.zshrc
plugins=( # other plugins... zsh-autosuggestions)
```

Add syntax highlight.\
[Install syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
```bash
sudo apt install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

## Revert to the previous shell
Switch back to the previous shell.
```
sudo apt --purge remove zsh
rm ~/.zshrc
rm -fr ~/.oh-my-zsh/
chsh -s $(which bash)
exit
```


# Create a Custom MOTD or Login Banner

System administrators would leave a message for users by using the Message of the Day "MOTD" file.

Setting a Basic Text MOTD in Linux.\
`sudo vim /etc/motd`.

Write your Message or Welcome banner motd file or you could add ASCII text banners from [Here](https://manytools.org/hacker-tools/ascii-banner/)

