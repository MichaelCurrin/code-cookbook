---
title: Global ignore
description: Tutorial to create and apply a global `.gitignore` file which applies to all repos on your machine
---


## 1. Edit your config

Add an excludes file to your ignore file.

```sh
$ git config --global core.excludesfile '~/.gitignore'
```

Note the quotes to _prevent_ tilde expansion in the shell. This makes it more reusuable, like if you have the same config on differen machines with different usernames or operating systems, you won't have `/home/mcurrin` or whatever hardcoded in there. 

Or add the following to your `~/.gitconfig` config file directly, then save it.

```toml
[core]
	excludesfile = ~/.gitignore
```


## 2. Create the ignore file

```sh
$ touch ~/.gitignore
```

Edit it.

Add any rules to it. For example:

```
# Linux folder attributes and PyCharm metadata.
.idea

# Mac folder attributes
.DS_Store
```

Save and exit.


## 3. Test the ignoring

Navigate to a repo.

Create a file or folder which is in your ignore list.

Then run:

```sh
$ git status
```

You will see the file or folder will be ignored.
