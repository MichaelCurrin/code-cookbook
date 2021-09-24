# Submodules


## Makefile

Here using `sm` to stand for submodule.

- `Makefile
    ```Makefile
    SUBMODULE_DIR = my-submodule
    
    sm-setup:
        git submodule init
        git submodule update

    sm-reset:
        git submodule update --force

    sm-pull:
        git submodule update --remote
        git status $(SUBMODULE_DIR) --short

    sm-commit:
        git commit $(SUBMODULE_DIR)
    ```

