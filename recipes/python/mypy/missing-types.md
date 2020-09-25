# Missing types

What to do when MyPy complains that an installed library does not support types, because it lacks type annotations or stubs.

> ... error: Cannot find implementation or library stub for module named '...'

See [Missing imports](https://mypy.readthedocs.io/en/latest/running_mypy.html#missing-imports) in the docs.


## Missing type hints for standard library module

1. Update and rerun MyPy.
2. File a bug report.


## Missing type hints for third party library

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
> These stub files do not need to be complete! A good strategy is to use stubgen, a program that comes bundled with mypy, to generate a first rough draft of the stubs. You can then iterate on just the parts of the library you need.

### Configure to ignore

- To suppress a single missing import error, add this at the end of the line containing the import:
    ```python
    import foo # type: ignore
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
