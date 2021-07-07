# Rebase


## Sign commits

Make sure have [GPG keys](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key) set up first.

```sh
$ git rebase -i COMMIT_REF --exec 'git commit --amend -S --no-edit'
```
