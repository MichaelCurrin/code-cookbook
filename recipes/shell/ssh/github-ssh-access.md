# Github SSH access
> How to setup your machine and Github profile to allow access by SSH


## Why

If you setup GitHub SSH access, then you can clone, push or pull using an SSH repo URL. Note the URL does not start with `https`.

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/code-cookbook.git
```

This avoids having to enter your password each time your push or if you pull a private repo. And this is especially useful if 2FA is setup. 

You can also use the SSH URL for any public repos by other people if you want to clone them (you won't be able to push unless you are a collaborator though).


## Generate keys

Follow the [install](install.md) guide to install SSH with APT.

Follow the [keys](keys.md) guide to generate a pair of SSH keys.


## View keys

View your _public_ key - the one with `.pub` extension. Copy it as you'll need to paste it in the next section.

```sh
$ view ~/.ssh/id_rsa.pub
```


## Add key to GitHub

1. Login to GitHub account.
1. Go to the SSH keys page 
    - [github.com/settings/keys](https://github.com/settings/keys)
    - Or
        1. Settings.
        1. SSH and GPG keys.
1. Create new SSH key.
1. Give it title description of your username and host. e.g. `Michael Dell (Linux Lite)`. This can be renamed.
1. Paste the public key copied from the previous section.


Based on [source](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account).
