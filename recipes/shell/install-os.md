# Install OS

Steps to follow to install a Linux operating system on a machine.

Instructions are based on the Linux Lite [Install](https://www.linuxliteos.com/manual/install.html) guide.


## Download image

For example, to download Linux Lite (based on Ubuntu).

Go to the download page:

- https://www.linuxliteos.com/download.php

And click the download ISO button.

The file is about 1 GB.


## Write

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
