# Configure SSH

Edit the SSH config.

```sh
$ nano ~/.ssh/config
```

Add a host with your details. Spaces or tabs are fine.

e.g.

```
Host web01
    HostName aws-ec2-www-server1.cyberciti.biz
    Port 22
    IdentityFile ~/.ssh/AWS_EC2_Virginia_US_East_Ubuntu_Boxes.pem
    User ubuntu
```

Then use it with `ssh` command.

```sh
$ ssh web01
```

[source](https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/)


## Host vs Hostname

The `Host` value is an alias which you use in the CLI.

```
Host my-alias
    HostName my-server.example.com
    User ubuntu
```

You can also omit `Hostname` and use that for your `Host`.

```
Host my-server.example.com
    User ubuntu
```

But, for _VSCode Remote SSH_ extension I found the Host must be the real value and not an alias and also the Hostname must be set so the value can appear in _Connections_. See [Getting started][]

[Getting started]: https://code.visualstudio.com/docs/remote/ssh#_getting-started


## User

```
Host my-server.example.com
    HostName my-server.example.com
    User mcurrin
    ServerAliveInterval 10
Host qa.my-server.example.com
    User mcurrin
    ServerAliveInterval 10
```


## Identify file

Use specific [SSH keys] for a host such as GitHub.

```
Host github.com
    IdentityFile ~/.ssh/id_rsa_abc
```

Then use `git clone` or similar as usual - that uses the `ssh` protocol internally.

[SSH keys]: {% link recipes/shell/ssh/keys.md %}


## Proxy

If you use a bastion as an intermediate step, you can add a proxy so you don't have to go through it explicitly.

```
Host bastprod
    HostName prod.bastion.example.com
Host my-server
    HostName prod.web.example.com
    ProxyCommand ssh bastprod -W %h:%p
```

Using a wildcard say for `www0` and `www1` servers.

```
Host www*.2u.com
    ProxyCommand ssh prod.bastion.example.com -W %h:%p
    ServerAliveInterval 10
```

## Other fields

```
Host *
   ForwardAgent no
```

Send packets every few seconds to stop disconnecting from inactivity.

```
    ServerAliveInterval 10
```

### Keychain

The default behavior for SSH keys was modified in MacOS Sierra such that SSH keys will NOT
automatically be added to the keychain.

The side effect of this is that you'll be asked for your key password every time you try to
connect to a remote host.

```
Host *
    UseKeychain yes
    AddKeysToAgent yes
    IdentityFile ~/.ssh/id_rsa
```

I came across this but didn't have had to use it.


## More examples

From [article](https://scotch.io/tutorials/how-to-create-an-ssh-shortcut).

```
Host scotch
    HostName scotch.io
    User nick

Host example2
    HostName example.com
    User root

Host example3
    HostName 64.233.160.0
    User userxyz123
    Port 56000

Host droplet1
    HostName droplet1.digitalocean.com
    User ec2-user
    IdentityFile /path/to/special/privatekey/droplet1.pem
```
