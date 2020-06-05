# Sudoers

Guide for Linux


## Manpage

```sh
$ man sudoers
```

## Running as superuser

### Perform action as root

```sh
$ sudo COMMAND
```

### Change to root

This is not recommended, as you might forget you are superuser. Also you won't have any alias like the interactive remove or copy which prevents overrides.

```sh
$ sudo su
```

### Configs

A text file. Do not edit this directly.

```
/etc/sudoers
```

Edit using:

```sh
$ sudo visudo
```

See also

```sh
$ ls /etc/sudoers.d/
```


### Avoid entering your password every time your run sudo

Set no password in sudoers.

```
%username ALL=(ALL) NOPASSWD:ALL 
```

[source](https://askubuntu.com/questions/21343/how-to-make-sudo-remember-my-password-and-how-to-add-an-application-to-startup)


## Keep sudo password for a set time

The machine will not prompt you again for your password for a time. More secure than the above.

Edit sudoers file.

Set a default.

```
Defaults        timestamp_timeout=300
```
