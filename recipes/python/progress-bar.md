# Progress bar


## Fish

- [fish](https://pypi.org/project/fish/) on Pypi

Here is the script with the logic - [fish.py](https://github.com/lericson/fish/blob/master/fish.py).

### Install

```sh
$ pip install fish
```

### Usage

Test on the CLI:

```sh
$ python -m fish
 >))'> 
```

Fish:

```
import fish


while churning:
    churn_churn()
   fish.animate()
```

The bass:

```
">))'>"
```

The salmon:

```
><{{{*>
```

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
  
At a lower level:

```python
msg = f"\x1b[2K\r{fish}\r"
sys.stderr.write(msg)
```
