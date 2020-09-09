# Datetime


## Test Strings

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


## Date and time

Loosely match a standard time in this format:

```
YYYY-MM-DDTHH:MM:SSZ
```

Note that this does not validate the number ranges, just that they are numbers.

```regex
\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z
```
