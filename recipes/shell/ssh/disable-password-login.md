# Disable password login

[source](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/) [source](https://www.cyberciti.biz/faq/how-to-create-a-sudo-user-on-ubuntu-linux-server/)

_Note that these tests have not been tested and some may be incorrect or unncessary. Consult more sources._

Only allow SSH login using known public keys rather than password-based.

This is more secure esspecially on a public network or public server.

On your client server, add your host machine as an identity.

```sh
eval $(ssh-agent)
ssh-add
ssh user@hostname
```

_Warning: Make sure you add yourself to sudoers files. Otherwise you will not able to login as root later on._

```sh
$ sudo vim /etc/ssh/sshd_config
```

Set

```
PermitRootLogin no
```

Add user to sudoers groups.

```sh
$ sudo adduser USER
$ sudo adduser USER sudo
```

Allow the group to do sudo.

```sh
$ sudo visudo
```

Add:

```
# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL
```

Restart the service.

```sh
sudo systemctl reload ssh
```
