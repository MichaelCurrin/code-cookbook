# Allow Github SSH access

Add your SSH key to Github so you can push with an SSH repo URL. This avoids having to enter your password each time your push or if you pull a private repo. And this is especially useful if 2FA is setup.


## Generate

Follow the [keys](keys.md) guide to generate a pair of keys.


## View

View your _public_ key - the one with `.pub` extension. Copy it as you'll need to paste it in the next section.

```sh
$ view ~/.ssh/id_rsa.pub
```


## Add key to Github

1. Login to Github account.
1. Go to the SSH keys page 
    - [github.com/settings/keys](https://github.com/settings/keys)
    - Or
        1. Settings.
        1. SSH and GPG keys.
1. Create new SSH key.
1. Give it title description of your username and host. e.g. `Michael Dell (Linux Lite)`. This can be renamed.
1. Paste the public key copied from the previous section.


Based on [source](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account).
