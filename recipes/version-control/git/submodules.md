# Submodules


Here using `sm` to stand for submodule.

- `Makefile
    ```Makefile
    sm-setup:
        git submodule init
        git submodule update

    sm-reset:
        git submodule update --force

    sm-pull:
        git submodule update --remote
        git status my-submodule --short

    sm-commit:
        git commit my-submodule 
    ```
