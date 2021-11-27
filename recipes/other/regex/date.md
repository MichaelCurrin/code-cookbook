# Date


## Valid date

Any valid date from the year 1000 onwards.

```regex
[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])
```

This is too simple to validate February, but it allows a month to have up to 31 days.


### Test strings

Match

```
1000-01-01
2017-01-01
2019-02-12
2020-03-30
2999-12-31
```

Don't match

```
0123-01-01
2020-13-01
2020-12-32
2020-12-40
```
