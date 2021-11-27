# Missing types

Sometimes, MyPy will complains that it cannot do typechecks for installed package.

> ... error: Cannot find implementation or library stub for module named '...'

See also [Missing imports](https://mypy.readthedocs.io/en/latest/running_mypy.html#missing-imports) in the MyPu docs.


## Missing type hints for built-in module

1. Update and rerun MyPy.
1. File a bug report.


## Missing type hints for third party library

If the package you installed does not have type annotations built in, then you can do one of the following.

- Upgrade the package.
- Find stubs that someone wrote for the package and has shared.
- Write your own, at least just for the portion of the package that you need.
- Add an ignore configuration.

Read on below to see those in more detail.

### Upgrade

Upgrade the version of the library you’re using, in case a newer version has started to include type hints.

### Find subs

> Search to see if there is a [PEP 561 compliant stub package](https://mypy.readthedocs.io/en/latest/installed_packages.html#installed-packages), corresponding to your third party library.
>
> Stub packages let you install type hints independently from the library itself. 
>
> For example, if you want type hints for the `django` library, you can install the `django-stubs` package.

### Write stubs

> Write your own stub files containing type hints for the library.
> 
> You can point mypy at your type hints either by passing them in via the command line, by using the files or mypy_path config file options, or by adding the location to the MYPYPATH environment variable.
> 
> These stub files do not need to be complete! A good strategy is to use **stubgen**, a program that comes bundled with mypy, to generate a first rough draft of the stubs. You can then iterate on just the parts of the library you need.

- [stubgen](https://mypy.readthedocs.io/en/stable/stubgen.html) in the MyPy docs

With MyPy installed, you can run:

```sh
stubgen foo.py
```

It will generate `out/foo.pyi`. You should place this in the same directory as the script.

See [Specifiying what to stub](https://mypy.readthedocs.io/en/stable/stubgen.html#specifying-what-to-stub)

See also these to to automatically annotate legacy code, according to the docs:

- [MonkeyType](https://monkeytype.readthedocs.io/en/latest/index.html)
- [PyAnnotate](https://github.com/dropbox/pyannotate)

### Configure to ignore

- To suppress a single missing import error, add this at the end of the line containing the import:
    ```python
    import foo # type: ignore
    ```
    Handle multi-line import. Note putting the comment after closing bracket doesn't work.
    ```python
    from foo.bar import (  # type: ignore
        FIZZ,
        BUZZ
    )
    ```
    
- Add to your MyPy [Config](config.md) file for package `foo`.
    ```ini
    [mypy-foo.*]
    ignore_missing_imports = True
    ```
    Or
    ```ini
    [mypy-foo]
    ignore_missing_imports = True
    ```
- Ignore across libraries:
    ```ini
    [mypy]
    ignore_missing_imports = True
    ```
