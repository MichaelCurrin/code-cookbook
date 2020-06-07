# SSH

Managing SSH service, keys and access.

See how to use a Github [Deploy key](ci-cd/github-actions/tokens/deploy-key.md) for running Github Actions.

## SSH directory

For quick reference, here is an example what is in the `.ssh` directory:

### Minimum

```sh
$ ls ~/.ssh
id_dsa           id_dsa.pub
```

## Detailed

```sh
$ ls ~/.ssh
authorized_keys   id_dsa       known_hosts
config            id_dsa.pub
```
