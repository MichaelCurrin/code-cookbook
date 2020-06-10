# Static IP
> Setup a static IP on your home network on Linux

## About

Setup a predictable IP address for your machine so you can connect to it reliably from other machines such as with SSH. Or even if you want to run a public server.

For example, setup as a fixed `192.168.1.10` IP. So you can connect with:

```sh
ssh michael@192.168.1.10`
```

### Supported

This guide was written for Linux Lite but should also apply for Ubuntu/Debian and even for macOS. The network manager GUI is different for each but the commands will be the same.


### Resources

- https://www.tecmint.com/set-add-static-ip-address-in-linux/
- https://www.lifewire.com/how-to-find-your-default-gateway-ip-address-2626072
- https://linuxhint.com/setup_static_ip_address_ubuntu/


## Connect

Connect to your WiFi network using standard settings. Your connection will default to Automatic DHCP i.e. you'll get a random IP.


## Check

Check your current IP address on the network.

```sh
$ ip a
```

It will be something near the bottom starting with `inet 192`.

e.g.
```
...
3: wlp6s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
  ...
  inet 192.168.1.36/24 brd 192.168.1.255 scope global noprefixroute wlp6s0
  ...
```

In this case the value is:

- `192.168.1.36`

The first and second digits are universal for local network.

The third digit is usually `8`, `1` or `0` - depending on your router.

And the last digit is important - be between 2 and 255. Usually it is on the low end.

And the `/24` part means the mask is `255.255.255.0` - not important for configuring but it determines allowed values.


## Check your gateway

```sh
$ netstat -nr
```

e.g.

```
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.1.1     0.0.0.0         UG        0 0          0 wlp6s0
192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 wlp6s0
```

The important value here is `192.168.1.1` under Gateway - it is the address of your router.


## Edit network settings

Open your connection settings and find the current WiFi connection.

Edit it.

Go to _IPv4 Settings_.

Change **Method** from _Automatic_ to _Manual_.

Add an address row.

- In this case we'll use `*.10` the address for this machine.
- Netmask can be left at default of `/24`.
- Gateway must be your router's gateway.

Fill in with values like:

Address | Netmask | Gateway
---     | ---     | ---
`192.168.1.10` | `/24` | `192.168.1.1`

Fill in _DNS servers_. This should be two comma-separated values, usually `8.8.8.8` and your gateway. I've also seen `8.8.8.8` and `4.4.4.4` in one guide.

e.g.

```
8.8.8.8, 192.168.1.10
```

Save.


## Disconnect

Turn off your WiFi settings - open the network bar and untick "Enable Wi-Fi".


## Connect

Turn on your WiFi settings.

## Test your connection


Run this - you should expect your new address to appear.

```sh
$ ip a
```

```
   ...
   inet 192.168.1.10
   ...
```

Open a page in the browser or do a ping check you are online.

```
ping google.com
PING google.com (172.217.170.78) 56(84) bytes of data.
64 bytes from jnb02s04-in-f14.1e100.net (172.217.170.78): icmp_seq=1 ttl=52 time=25.9 ms
```

## Conclusion

You now have a static IP address setup on your machine.

You can disconnect from the network (such leaving or turning off) and when you connect again, you'll get the same predictable network IP.

Note that if another machine has selected this machine already, either deliberately or randomly, you'll be unable to connect.

So you might want to lock all your machines to manual values, or choose a high last digit - the random digits are in the low range I've noticed.
