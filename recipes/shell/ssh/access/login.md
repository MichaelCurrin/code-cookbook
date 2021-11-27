# Login by SSH


## Login

Set hostname from `/etc/hosts` or the IP address. Use is optional if you've set up your configs.

```sh
$ ssh user@hostname
```

Enter the password if prompted.


## Copy

```sh
$ scp foo.txt use@hostname:~/Downloads
```


## Allow SSH access without password

Here we copy your public key to the other machine's allowed public keys, so that can run SSH commands as usual but your machine with authenticate using keys and it won't prompt you for a password. This approach is a lot harder to crack than a password.

Two approaches are covered below.

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

Alternative, using `scp` command.

```sh
$ scp $HOME/.ssh/id_rsa.pub foo@bar:~/.ssh/authorized_keys
```
