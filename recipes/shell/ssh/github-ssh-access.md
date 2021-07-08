---
title: GitHub SSH access
description: Set up SSH keys on your machine and GitHub profile
---

How to set up SSH on your machine from scratch and configure SSH access on your GitHub account. So you can do a clone, push and pull action using SSH repo URLs.


## Why

If you set up GitHub SSH access, then you can clone, push or pull using an SSH repo URL. Note the URL does not start with `https`, unlike the usual **HTTP(* accesd method, which is less secure.

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/code-cookbook.git
```

This avoids having to enter your **password** each time your push, or if you pull a private repo. And this is especially useful if **2FA** is setup.

You can also use the SSH URL for any **public** repos by other people if you want to clone them (you won't be able to push unless you are a collaborator though).

## Steps

### 1. Generate keys

1. Follow the [Install SSH][] recipe to install SSH itself.
2. Follow the [SSH keys][] recipe to generate a pair of SSH keys.

[Install SSH]: {{ site.baseurl }}{% link recipes/shell/ssh/install.md %}
[SSH keys]: {{ site.baseurl }}{% link recipes/shell/ssh/key.md %}

### 2. View keys

View your _public_ key - the one with `.pub` extension. Copy it as you'll need to paste it in the next section.

```sh
$ view ~/.ssh/id_rsa.pub
```

### 3. Add key to GitHub

1. Login to GitHub account.
1. Go to the SSH keys page
    - [github.com/settings/keys](https://github.com/settings/keys)
    - Or
        1. Settings.
        1. SSH and GPG keys.
1. Create new SSH key.
1. Give it title description of your username and host. e.g. `Michael Dell (Linux Lite)`. This can be renamed.
1. Paste the public key copied from the previous section.

Based on [tutorial](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) in the GitHub docs.

### 4. Use it

Clone a public repo or one of your private repos using an SSH URL.

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/code-cookbook.git
```

