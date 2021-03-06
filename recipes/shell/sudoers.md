---
description: How to act as the root user
---
# Sudoers

Guide for Linux


## View manpage

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

Read the config file. Do not edit this directly.

```sh
$ view /etc/sudoers
```

Edit using:

```sh
$ sudo visudo
```

See also a directory for adding local content.

```sh
$ ls /etc/sudoers.d/
```


### Do admin actions without entering password

Configure your system to avoid entering your password every time your run sudo.

Add this as a row to sudoers config under this section. Replace `foo` with username.

```
foo ALL=(ALL) NOPASSWD:ALL
```

It might even work do to `%foo` if that references a group.

- [source](https://askubuntu.com/questions/21343/how-to-make-sudo-remember-my-password-and-how-to-add-an-application-to-startup)
- [source](https://askubuntu.com/questions/147241/execute-sudo-without-password)

Another source says to edit the `admin` line:

```
%admin ALL=(ALL) NOPASSWD: ALL
```

[source](https://www.ubuntugeek.com/how-to-disable-password-prompts-in-ubuntu.html)


## Remember sudo password for a set time

The machine will not prompt you again for your password for a time. More secure than the above.

Edit sudoers file.

Set a default.

```
Defaults        timestamp_timeout=300
```

[source](https://unix.stackexchange.com/questions/216891/how-do-i-make-sudo-remember-my-password-for-longer)
