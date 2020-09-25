# Missing types

What to do when MyPy complains that an installed library does not support types, because it lacks type annotations or stubs.

[Missing imports](https://mypy.readthedocs.io/en/latest/running_mypy.html#missing-imports) in the docs.


## No types for 3rd-party library

### Upgrade

Upgrade the version of the library you’re using, in case a newer version has started to include type hints.

### Find subs

Search to see if there is a [PEP 561 compliant stub package](https://mypy.readthedocs.io/en/latest/installed_packages.html#installed-packages), corresponding to your third party library. Stub packages let you install type hints independently from the library itself. For example, if you want type hints for the `django` library, you can install the `django-stubs` package.

### Write stubs

Write your own stub files containing type hints for the library. 

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
  - Ignore across libraries:
    ```init
    [mypy]
    ignore_missing_imports = True
    ```
