# Login by SSH


## Login

Set hostname from `/etc/hosts` or the IP address. Use is optional if you've setup your configs.

```sh
$ ssh user@hostname
```

Enter the password.


## Add your machine the remote

Allow SSH access without the password. 

Copy your public key to the other machine's allowed public keys.

[source](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)

### SSH Copy ID

We use the `ssh-copy-id` command here.

> ssh-copy-id — use locally available keys to authorise logins on a remote machine

```sh
$ ssh-copy-id user@hostname
```

Optionally set an identify file.

```sh
$ ssh-copy-id -i ~/.ssh/id_rsa.pub user@hostname
```


### Secure Copy

Equivalent, using `scp`.

```sh
$ scp $HOME/.ssh/id_rsa.pub foo@bar:~/.ssh/authorized_keys
```
