---
---
# SSH

Managing SSH service, keys and access.


## Summary

The least you need to know:

### Install

See [install](install.md) page.


### Check current setup

```sh
$ ls ~/.ssh/
```

### Generate keys

Create a pair of files. Here we use `rsa`.

```sh
$ ssh-keygen -t rsa
```

### Configure

```sh
$ nano ~/.ssh/config
```

### Deploys

To create an SSH deploy key and use it for GitHub actions, see the [Deploy key](/recipes/ci-cd/github-actions/tokens/deploy-key.md) of the CI/CD Github Actions section of this project.
