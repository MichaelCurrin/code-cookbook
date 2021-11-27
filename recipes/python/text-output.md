# Text output


## Keep on same line

Use `print` with `end` argument to prevent adding a newline. Using `'\n'` is the default, so use an empty string or a space instead.

```python
import time

for i in range(1, 200):
    print(i, end="")
    time.sleep(0.2)
```

```
# 123...
```

Using `end=" "` instead.

```
1 2 3...
```


## Write and overwrite line

Such as for a progress bar.

```python
import time


for i in range(1, 200):
    print(i, end="")
    time.sleep(0.2)
    print("\r", end="")
```

Then that prints:

```
1
```

Then uses carriage return to delete the line.

Then prints 

```
2
```

As so on.

If you want to align text to the right:


```python
import time


for i in range(1, 200):
    print(f"{i:>3}", end="")
    time.sleep(0.2)
    print("\r", end="")
```

So it will make this:

```
  1
  2
 ...
 10
 11
...
100
...
```
