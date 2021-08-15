# Progress bar

{% raw %}

## Fish

- [fish](https://pypi.org/project/fish/) on Pypi

Here is the script with the logic - [fish.py](https://github.com/lericson/fish/blob/master/fish.py).

### Install

```sh
$ pip install fish
```

### Usage

Test on the CLI:

```console
$ python -m fish
 >))'>
```

Fish:

```python
import fish


while churning:
    churn_churn()
   fish.animate()
```

The bass:

    ">))'>"

The salmon:

    ><{{{*>

Bird:

- `app.py`
    ```python
    from fish import Bird


    bird = Bird()

    while True:
        bird.animate()
    ```

```
           ___
       _,-' ______
     .'  .-'  ____7
    /   /   ___7
  _|   /  ___7
>(@)\ | ___7
  \\/     \_____,.'__
  '        _/''&;>*
  `'----\\`
```

There's also a duck.

```
     _
\. _(9>
 \==_)
  -'=
```

There's also an option to show a percentage rather than just a continuously moving animation that goes left and right across the screen until it is done.

A recommendation to your own, at a lower level:

```python
msg = f"\x1b[2K\r{fish}\r"
sys.stderr.write(msg)
```


## Progressbar

- [progressbar2](https://pypi.org/project/progressbar2/) on Pypi

```python
import time

import progressbar


for i in progressbar.progressbar(range(100)):
    time.sleep(0.02)
```

{% endraw %}
