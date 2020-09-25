# Config
> Setting up a MyPY config file

See [Config file](https://mypy.readthedocs.io/en/latest/config_file.html) in the MyPy docs.


## Project config

Add in the repo:

- `mypy.ini`
- `.mypy.ini`
- `setup.cfg` 


## Use config

- `~/.config/mypy/config`
- `~/.mypy.ini`


## Sample

- `sample.ini`
  ```ini
  # Global options:

  [mypy]
  python_version = 2.7
  warn_return_any = True
  warn_unused_configs = True

  # Per-module options:

  [mypy-mycode.foo.*]
  disallow_untyped_defs = True

  [mypy-mycode.bar]
  warn_return_any = False

  [mypy-somelibrary]
  ignore_missing_imports = True
  ```
  
