# Disable password login

Prevent SSH login by password so only login by SSH key is allowed, for security. Set this up on a remote machine that you plan to SSH to.

Only allow SSH login using known public keys rather than password-based. This is more secure especially on a public network or public server.

[source](https://www.cyberciti.biz/faq/how-to-disable-ssh-password-login-on-linux/)

Edit the config file:

```sh
$ sudo vi /etc/ssh/sshd_config
```

Set these all to `no`:

```
ChallengeResponseAuthentication no

PasswordAuthentication no

UsePAM no

PermitRootLogin no
```

Then reload:

```sh
$ /etc/init.d/ssh reload
```
Or

```sh
$ sudo systemctl reload ssh
```

Then try to access the machine. Note even if you only have one machine, you can SSH from a machine to itself.

```sh
$ ssh foo@bar
```

Force password login - expect an error.

```sh
$ ssh foo@bar -o PubkeyAuthentication=no
```

