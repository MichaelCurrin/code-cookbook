# Allow login by SSH key

This is secure as it a machine is configured to accept SSH access from known public keys (which have the appropriate private key too) so that a password prompt is not given.

This approach works best when login by password is also disabled - see another guide in this folder.

Note I copied these instructions and have not tested. Also using `%username` or `%admin` might be better in the SSHD config than `%sudo`.

Based on:

- [source](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)
- [source](https://www.cyberciti.biz/faq/how-to-create-a-sudo-user-on-ubuntu-linux-server/)

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

_Warning: Make sure you add yourself to sudoers files. Otherwise you will not able to login as root later on._

```sh
$ sudo vim /etc/ssh/sshd_config
```

Set this to disable root login over SSH.

```
PermitRootLogin no
```

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

Then add:

```
# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL
```

Restart the service.

```sh
sudo systemctl reload ssh
```
