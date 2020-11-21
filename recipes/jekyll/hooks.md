# Hooks

- `Makefile`
    ```mk
    .PHONY: hooks
    hooks:
      # Don't use -r flag as it is not widely compatible.
      cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push
      ls -l ./.git/hooks/pre-push
    ```
- `hooks/pre-push`
    ```sh
    #!/bin/sh -e

    git pull --rebase

    # Prevent push on failed Jekyll build.
    make build
    ```
