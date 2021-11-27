# Install SSH service

## Brew

From [openssh](https://formulae.brew.sh/formula/openssh) formula.

```sh
$ brew install openssh
```


## Linux

### Install OpenSSH

```sh
$ sudo apt-get install openssh-server openssh-client
```

### Verify SSH service is running

```sh
$ sudo systemctl status ssh
```

If necessary:

```sh
$ sudo systemctl enable ssh
$ sudo systemctl start ssh
```

### Configure

You may need to allow port `22` for SSH to work.

```sh
$ sudo ufw allow ssh
$ sudo ufw enable
$ sudo ufw status
```
