# Add to project
> How to add MyPY to your project for type checking


1. Update your [requirements-dev.txt](/requirements-dev.txt) to include line:
    ```
    mypy
    ```
2. Install it. e.g. one of
    ```sh
    $ pip install mypy
    $ pip install -r requirements-dev.txt
    $ make install-dev
    ```
3. Add type checks to you `.py` files.
4. Add target to [Makefile](/Makefile). With specific directories to check as args. e.g.
    ```make
    check-types:
        mypy my_project tests
    ```
5. Update `.gitignore` to include line:
    ```
    .pytest_cache/
    ```
