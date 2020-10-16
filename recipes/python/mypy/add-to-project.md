# Add to project
> How to add Mypy to your project for type checking


## 1. Setup

1. Update your [requirements-dev.txt](/requirements-dev.txt) to include line:
    ```
    mypy
    ```
1. Install it using one of the following:
    ```sh
    $ pip install mypy
    $ pip install -r requirements-dev.txt
    $ make install-dev
    ```
1. Update `.gitignore` to include this line:
    ```
    .mypy_cache/
    ```


## 2. Check types

Add type checks to you `.py` files.

Check types directly.

```sh
$ mypy my_project tests
```

Or with `make`:

1. Add target to [Makefile](/Makefile). With specific directories to check as args. e.g.
    ```make
    check-types:
        mypy my_project tests
    ```
1. Check types.
    ```
    make check-types
    ```

Or `type-check` or `typecheck`.


## 3. Add to CI/CD pipeline

Add a step your pipeline such GitHub Actions.

- `main.yml`
    ```yaml
    steps:
      - name: Check types
        run: make check-types
    ```
