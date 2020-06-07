# SSH config

```sh
$ nano ~/.ssh/config
```

Example:

```
Host web01
        HostName aws-ec2-www-server1.cyberciti.biz
        Port 22
        IdentityFile  ~/.ssh/AWS_EC2_Virginia_US_East_Ubuntu_Boxes.pem
        User ubuntu
```

```sh
$ ssh web01
```

[source](https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/)
