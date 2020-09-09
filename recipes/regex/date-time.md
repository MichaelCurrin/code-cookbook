# Date and time


## Date and time

Loosely match a standard time in this format:

```
YYYY-MM-DDTHH:MM:SSZ
```

Note that this does not validate the number ranges, just that they are numbers.

```regex
\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z
```

### Test Strings

Match

```
2020-09-08T09:42:25Z
2020-12-01T01:23:25Z
```

Don't match

```
abcd-09-08T09:42:25Z
2020-09-08T09:42:25
2020-09-08X09:42:25Z
```


## Range

Business hours 9am to 5pm. Include loosely-matched date and ends with milliseconds:

```regex
\d{4}-\d{2}-\d{2}T(09|1[0-6]):[0-5]\d:\d\dZ
```

### Test strings

```
2020-12-01T00:00:00Z
2020-12-01T01:12:00Z
2020-12-01T02:34:00Z
2020-12-01T03:56:00Z
2020-12-01T04:00:00Z
2020-12-01T05:00:00Z
2020-12-01T06:00:00Z
2020-12-01T07:00:00Z
2020-12-01T08:00:00Z
2020-12-01T08:59:00Z
2020-12-01T09:00:00Z
2020-12-01T09:35:00Z
2020-12-01T10:00:00Z
2020-12-01T11:12:00Z
2020-12-01T12:34:00Z
2020-12-01T13:56:00Z
2020-12-01T14:18:00Z
2020-12-01T15:59:00Z
2020-12-01T16:00:00Z
2020-12-01T16:59:00Z
2020-12-01T17:00:00Z
2020-12-01T18:00:00Z
2020-12-01T19:00:00Z
2020-12-01T20:00:00Z
2020-12-01T21:00:00Z
2020-12-01T22:00:00Z
2020-12-01T23:00:00Z
```
