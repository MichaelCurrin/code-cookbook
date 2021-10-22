# Mac Control Strip

From [article](https://9to5mac.com/2020/01/20/mac-how-to-fix-and-restart-the-touch-bar/).

If the OLED Control Strip stops working, run this:

```sh
$ sudo pkill TouchBarServer
```

Root access is needed.

That worked for me. You might also need this:

```sh
$ sudo killall "ControlStrip"
```
