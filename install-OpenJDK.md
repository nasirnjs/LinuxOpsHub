


## Method 2: Install OpenJDK 17 Manual Method on Ubuntu

Installing OpenJDK downloading the .tar.gz archive package. While this option is often more up-to-date than the version in the Ubuntu repository, it requires more manual maintenance, as you’ll need to keep an eye on new updates and repeat the installation process.

Steps 1. Visit the [downloads](https://jdk.java.net/archive/) page to obtain the latest build version link. Then, use the following wget command to download the package. Here’s an example of downloading OpenJDK 18 versio.

`wget https://download.java.net/java/GA/jdk18/43f95e8614114aeaa8e8a5fcf20a682d/36/GPL/openjdk-18_linux-x64_bin.tar.gz`

Steps 2. Once the download process is complete, extracting the archive.

`tar -xvf openjdk-18_linux-x64_bin.tar.gz`

3. Moved the JDK 18 directory to `/usr/local/`\
`sudo mv jdk-18 /usr/local/`

4. Set the JAVA_HOME environment variable to point to the JDK 18 installation.\
`export JAVA_HOME=/usr/local/jdk-18`

5. Added the bin directory of the JDK to your PATH.\
`export PATH=$JAVA_HOME/bin:$PATH`

6. To add the JAVA_HOME and PATH variables permanently in your .bashrc file, 

    `vim ~/.bashrc`

```bash
# Set JAVA_HOME environment variable
export JAVA_HOME=/usr/local/jdk-18
# Add JDK bin directory to PATH
export PATH=$JAVA_HOME/bin:$PATH

```
7. Reloaded the shell configuration to apply the changes.\
`source ~/.zshrc`

1. Checked the Java version to confirm the installation.\
`java --version`

**Optional**\
If you want to add multiple java in registered as an alternative in your system.

`sudo update-alternatives --install /usr/bin/java java /usr/local/jdk-18/bin/java 100`

`update-alternatives --list java`

To configure the default Java runtime environment.\
`sudo update-alternatives --config java`

[Ref](https://www.linuxcapable.com/how-to-install-openjdk-17-on-ubuntu-linux/)
