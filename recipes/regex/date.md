# Date


## Test strings

2017-02-14 19:30
2017-02-14 19:30
2020-02-14 19:30


## Valid date

Any valid date from the year 1000 onwards.

```regex
[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])
```

This is too simple to validate February, but it allows a month to have up to 31 days.
