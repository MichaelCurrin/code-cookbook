# Time


## Hours and minutes

Match a 24-hour `HH:MM` time value.

Match any time:

```re
(2[0-3]|0[0-11]|1[2-9):[0-5][0-9]
```


## Time range

Match a 24-hour `HH:MM` time value only if in a time range.

### Business hours

Only match 9am-5pm i.e. `09:00` to `16:59`.

```re
(09|1[0-6]):[0-5]\d
```

### Outside of business hours

Only match times outside business hours.

```re
(2[0-3]|0[0-8]):[0-5]\d
```


## Test strings

Use for any of the sections above.

```
00:00
01:12
02:34
03:56
04:00
05:00
06:00
07:00
08:00
09:00
10:00
11:12
12:34
13:56
14:18
15:59
16:00
17:00
18:00
19:00
20:00
21:00
22:00
23:00
```
