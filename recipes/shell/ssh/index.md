---
---
# SSH

Managing SSH service, keys and access.


## Summary

The least you need to know:

### Install

See the [Install][] page.

[Install]: {% link recipes/shell/ssh/install.md %}

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

To create an SSH deploy key and use it for GitHub actions, see the [Deploy key](/recipes/ci-cd/github-actions/tokens/deploy-key.md) of the CI/CD GitHub Actions section of this project.

### Related

- [SSH](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/shell/ssh/) section of my Dev Cheatsheets project.
