# Hooks

Prevent push on failed Jekyll build.

## 1. Setup hook file

Create the file. 
    
- `hooks/pre-push`
    ```sh
    #!/bin/sh -e

    git pull --rebase
    make build
    ```
    
Use `sh` as per standard git hooks flow. It has reduced access and syntax but this is fine. 

Optionally add `make install`. Or `make all` if that uses the install and build steps.

Then make it executable.

```sh
$ chmod +x hooks/pre-push
```


## 2. Setup Makefile

Add a command. I like to add it before `install`.


- `Makefile`
    ```mk
    install:
    	# ...

    .PHONY: hooks
    hooks:
    	cd .git/hooks && ln -s -f ../../hooks/pre-push pre-push
    ```
  
Don't use `-r` relative flag as it doesn't work on macOS. But if you use `cd` then you go into the directory and use a relative path up two levels. Note the phony is needed because hooks is an actual directory and not just a command target.


## 4. Complete the hook setup

Set up hooks.

```sh
$ make hooks
```

Check it worked.

```sh
$ ls -l .git/hooks/pre-push
```
You should see something like:

```
... ... ... pre-push -> ../../hooks/pre-push
```

The hook will run whenever you push this on the command-line, or using your IDE.

```sh
$ git push
```

If you have uncommitted changes, you'll get an error. You'll have to stash them first so the rebase can work. Here we included _untracked_ changes.

```sh
$ git stash -u && git push && git stash pop
```

## 4. Clean-up

You'll need to commit your `Makefile` and `hooks` directory to git.
Add the instructions to your Installation doc's steps. 

If you have any other local dev environments or other developers working on this project, make sure the hook gets set up on each machine.

