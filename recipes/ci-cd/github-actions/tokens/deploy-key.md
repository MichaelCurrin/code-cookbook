---
description: A repo-scoped GitHub tokens useful for automated deploys
---
# Deploy key

{% raw %}


## About

- A deploy key is an SSH public key.
- The token must be be generated **manually** using the local command-line.
- It takes more effort to set up than the other steps.
- Use it in an action using this:
    ```yaml
    ${{ secrets.DEPLOY_KEY }}
    ```
- It can be used to **read** from a Git repo (including a private one) and deploy it on a remote server.
- Optionally it can have **write** access - such as for writing to a deploy branch.


## How to generate a SSH key

- If the machine doesn't have an SSH key set, you'll have to generate one.
- Even if it has one, you might choose to create a new one that is used specifically for GitHub, so you could delete if you want and leave behind one that you use for other SSH purposes.

### Generate

Run this locally:

```sh
$ ssh-keygen
```

Or, according to [gist](https://gist.github.com/zhujunsan/a0becf82ade50ed06115) on using it on a Linux server - not in the GH Actions context.

```sh
$ ssh-keygen -t rsa -b 4096 -C "foo@bar.com"
```

The comment can be an email address, or a machine identifier based on your username and hostname e.g. `my-user@dell` where you generated. For GitHub Actions the email makes more sense as you won't actually use the local machine to do a deploy so the machine identifier does not make sense.


### View

```sh
$ cat ~/.ssh/id_rsa.pub
```

[SSH guide](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) on GitHub docs.


## How to add a deploy key on GitHub

1. Go to repo Settings.
1. Go to Deploy Keys.
1. Create key.
    - Set **title** with a convenient value to later reference. This can have spaces in it.
    - Paste into **key** as an SSH public key (so only that a certain machine can deploy).
    - Optionally tick **Allow write access**.


{% endraw %}
