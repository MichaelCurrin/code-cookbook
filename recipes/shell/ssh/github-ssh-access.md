---
title: GitHub SSH access
description: Set up SSH keys on your machine and GitHub profile
---

How to set up SSH on your machine from scratch and configure SSH access on your GitHub account. So you can do a clone, push and pull action using SSH repo URLs.


## Related

- [GitHub](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/version-control/github/) cheatsheet in my Dev Cheatsheets


## Why

You need access to a repo to do clone, push, or pull it. 

- For the HTTP URL of a private repos or altering a public repo, you would have to enter your GitHub password each time and also your OTP if you use that. The downside is that this password can be used on other machines (such as by a stranger). And you have to enter your password each time (unless you opt to have it remembered for say 5 min). e.g.
    ```sh
    $ git clone https://github.com/MichaelCurrin/code-cookbook.git
    ```
- If you set up GitHub SSH access and use an SSH URL instead, you'll have something more secure as they key will only work on your machine (provided you don't share your private key on other machines). e.g.
    ```sh
    $ git clone git@github.com:MichaelCurrin/code-cookbook.git
    ```
    
So using an HTTP URL is less secure as it needs a password or token. Using an SSH URL means you allow an SSH key-pair for a specific device.


## Steps

### 1. Generate keys

1. Follow the [Install SSH][] recipe to install SSH tool on your machine.
2. Follow the [SSH keys][] recipe to generate a pair of SSH keys.

[Install SSH]: {% link recipes/shell/ssh/install.md %}
[SSH keys]: {% link recipes/shell/ssh/keys.md %}


### 2. View keys

View your _public_ key - the one with `.pub` extension. Copy it, as you'll need to paste it in the next section.

```sh
$ view ~/.ssh/id_rsa.pub
```

You will also have a _private_ key as `~/.ssh/id_rsa`, though you don't need to access this directly and this should never be shared.

### 3. Add public key to GitHub

1. Login to GitHub account.
1. Go to the SSH keys page
    - [github.com/settings/keys](https://github.com/settings/keys)
    - Or go to:
        1. Settings.
        1. SSH and GPG keys.
1. Create a new SSH key.
1. Give a title as description of your name (like `Michael` or `mcurrin`) and host (like `Mac` or `Dell`). e.g. `Michael Dell`. This can be renamed later esly.
1. Paste the _public_ key copied from the previous section and save.

That is based on this [tutorial](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) in the GitHub docs.

### 4. Use it

Go to a repo on GitHub.

Find the clone URL. Make sure to pick the _SSH_ option.

Clone the URL locally. 

e.g.

```sh
$ git clone git@github.com:MichaelCurrin/code-cookbook.git
```
