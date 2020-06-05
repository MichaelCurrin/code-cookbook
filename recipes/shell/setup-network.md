# Setup network

If you want to communicate between two machines on a network.


## Find current IP

If you need to find your current IP, run:

```sh
$ ip a

...
192.168.8.10
```

Or

```sh
$ ifconfig -a

...
192.168.8.10
```

Then you can connect to it.

e.g.

```sh
$ ssh foo@192.168.8.10
```


## Static IP

Update your settings for the connection - choose manual/static IP and hardcode an IP so that machine always tried to connect with that IP.

e.g.

```
192.168.8.5
```

You might have to turn Wi-Fi off and on again to connect.

Then check what your IP address is and you'll see the manaul address.



## Use host alias

If you have a static IP on the network, then you can add an alias to it for convenience.

Edit the hosts file/

```sh
$ edit /etc/hosts
```

Add the target machine's IP and an alias. Note a **tab** and not spaces between.

```
192.168.8.5   bar
```

Then connect with:

```sh
$ ssh foo@bar
```

Or copy

```sh
$ scp fizz.txt foo@bar:~/Documents
```
