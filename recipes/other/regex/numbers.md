# Numbers

## Dot to comma

Use this in VS Code on a text file with a number on each row. Run the replacement a second time to fix longer numbers.

Any numbers already using a comma thousands separator will be unaffected.

Expect a number like:

```
1.000.000.00
  123.456.00
```

And convert to:

```
1,000,000.00
  123,456.00
```

### Find

```re
(\d)\.(\d\d\d)
```

### Replace

```
$1,$2
```
