# Rebase


## Sign commits

Make sure have [GPG keys](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key) set up first.

```sh
$ git rebase -i COMMIT_REF --exec 'git commit --amend -S --no-edit'
```


## Rebase on main branch

```sh
$ git checkout my-branch
$ git pull --rebase upstream main
$ git push --force
```

Or

```sh
$ git checkout my-branch
$ # This will update `origin/main` but not your local `main`.
$ git fetch 

$ # Put your branch's commit on top of main's.
$ git rebase origin/main
$ git push --force
```


## Rebase fork onto original repo

Say you have a fork and are working on a feature branch.

Then you want to rebase onto the original repo's main branch.

```sh
$ # Start off on origin.
$ git checkout my-branch

$ Add upstream if you haven' already.
$ git remote add upstream git@github.com:MichaelCurrin/abcdef.git
$ # Put your commits on top of the upstream repo's.
$ git pull --rebase upstream main
$ git push --force
```

