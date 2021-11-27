# Allow login by SSH key

## Why

This is secure as a machine is configured to accept SSH access from known public keys (which have the appropriate private key too). So that a password prompt is not given.

A password is much easier to crack than a long SSH key. And while you have to remember a password and type it, you don't have to enter a password for SSH because it is based on a trust. You can also add a password to an SSH key if you really want.

This approach works best when login by password is also disabled - see another guide in this folder. See [Disable Password Login][] page.

[Disable Password Login]: {% link recipes/shell/ssh/access/disable-password-login.md %}


## Steps

Note I copied these instructions and have not tested.

Based on:

- [source](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)
- [source](https://www.cyberciti.biz/faq/how-to-create-a-sudo-user-on-ubuntu-linux-server/)

### 1. Add host machine's indentity

The host is the one you plan to use directly (like your laptop), while the target server is one you are connecting to (a laptop in another room or in another building or a remote server in the cloud).

On your target server, add your host machine as an identity:

```sh
$ eval $(ssh-agent)

$ # Add user to a list maintained by ssh agent.
$ ssh-add

$ # List
$ ssh-add -L

$ # Access the machine. You'll get prompted to add the identity.
$ ssh foo@bar
```

You'll have to enter a password this time. But the idea with what we set up here is that in future you won't have to.

### 2. Configure SSH

```sh
$ sudo vim /etc/ssh/sshd_config
```

Set this to disable root login over SSH.

```
PermitRootLogin no
```

### 3. Configure sudoers group

_Warning: Make sure you add yourself to sudoers files. Otherwise you will not able to login as root later on._

Add user (e.g. `foo`) to sudoers group.

```sh
$ sudo adduser foo
$ # Or
$ sudo adduser foo sudo
```

Allow the group to run sudo.

```sh
$ sudo visudo
```

Then add this if it doesn't exist.

```
# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL
```

### 4. Restart

Restart the service.

```sh
sudo systemctl reload ssh
```
