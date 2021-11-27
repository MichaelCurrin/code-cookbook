# Host name

This guide focuses on personal computers running on Linux and not remote machines.

This is the system hostname value you see in the command prompt.

```
USERNAME@HOSTNAME:~$
```

The hostname does not affect how you connect to other machines on the network.


## View hostname

```sh
$ hostname
```

## Change hostname


```sh
$ sudo nano /etc/hostname
```

Replace the value and value.

Restart your machine.

```sh
$ sudo reboot
```
