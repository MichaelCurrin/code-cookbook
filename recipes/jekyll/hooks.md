# Hooks

Prevent push on failed Jekyll build.


1. `hooks/pre-push` - create file. 
    Use `sh` as per standard git hooks flow. It has reduced access and syntax but this is fine. Optionally add `make install`. Or `make all` if that uses the install and build steps.
    ```sh
    #!/bin/sh -e

    git pull --rebase
    make build
    ```
1. Make it executable.
    ```sh
    $ chmod +x hooks/pre-push
    ```
1. `Makefile` - add command. Don't use `-r` relative flag as it doesn't work on macOS. But if you use `cd` then you go into the directory and use a relative path up two levels. Note the phony is needed because hooks is an actual directory and not just a command target.
    ```mk
    .PHONY: hooks
    hooks:
    	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push
    	ls -l .git/hooks/pre-push
    ```
1. Set up hooks.
    ```sh
    $ make hooks
    ```
1. Check it worked.
    ```sh
    ls -l ./.git/hooks/
    ```
1. Add the instructions to your Installation doc's steps.
