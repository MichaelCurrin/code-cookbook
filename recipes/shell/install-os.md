# Install OS

Steps to follow to install a Linux operating system on a machine.

Instructions are based on the Linux Lite [Install](https://www.linuxliteos.com/manual/install.html) guide.


## 1. Choose an OS

Go through the popular flavors of Linux - [gist](https://gist.github.com/MichaelCurrin/eeb0ba4943291aa3ed3a14c8ebece891).

We use Linux Lite in this guide.


## 2. Download image

For example, to download Linux Lite - go to the download page:

- https://www.linuxliteos.com/download.php

And click the download ISO button.

The file is about 1 GB.


## 3. Write to storage media

Follow the USB or DVD instructions below.

### Write to USB

#### Using GUI

Create a bootable USB drive. Note that you should make sure there is nothing else on the drive.

Etcher is a GUI application allows you to create a bootable Live USB drive. You will need a 4Gb or larger USB drive. Download Etcher from here.

- https://www.balena.io/etcher/

#### Using command-line

Use the terminal on macOS or Linux.

```sh
$ df -h
```

Find your flash as a media item in the output.

```
Filesystem ... Mounted on
...
/dev/sdb1  ... /media/myuser/FOO
```

Note the file system. Then use that value below, _excluding_ the number.

```sh		
$ sudo dd if=linux-lite-5.0-64bit.iso of=/dev/sdb bs=4M
```

### Write to DVD

1. Download free disk burning software.
    - K3b (from KDE i.e. for Debian) - https://kde.org/applications/en/multimedia/org.kde.k3b
    - BurnAware Free - http://www.burnaware.com
    - CDBurnerXP - http://cdburnerxp.se/
    - ImgBurn - http://www.imgburn.com/
1. Place a blank writable DVD in your DVD drive.
1. Open the program
1. Select the ISO file.
1. Choose the lowest burn speed - this reduces the chance of corruption.


## 4. Boot up and install

Insert your DVD or USB drive into the target machine and start it.

Follow the prompts.

You may choose to boot in the OS without actually persisting any changes. This is convenient for trying out without committing.

If you want, follow the prompts to install the OS to the machine. You'll be asked if you want to use a partition (keeping the existing OS and allowing dual-boot) or to overwrite the entire machine with the new OS.

At some point you'll be asked to reboot your machine to complete the installation. You might want to remove your storage media just before doing this, as you don't need it anymore.
