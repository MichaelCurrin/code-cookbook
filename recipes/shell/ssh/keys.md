# SSH keys

SSH is about identity verification - proving who you are when starting a shell tunnel that needs to be secure.

Note that this page assumes you followed the [install](install.md) page to get SSH service running and the CLI commands available.


## About keys

SSH works using a combination of public and private keys.

Files:

- `id_rsa` - private key.
- `id_rsa.pub` - public key.

Both exist on your machine.

The public and private keys work together with encryption algorithms. Your public key can be added to authorized keys on another machine or on GitHub account. So that host will allow a machine to connect if its public key matches what is has stored, but the connecting machine must also have the appropriate private key which is used in the connection but not sent directly.


## View SSH keys

Even if SSH is installed, you don't necessarily have keys setup.

Check for SSH keys - you'll get an error if the directory doesn't exist.

```sh
$ ls -la ~/.ssh/
```

View the value of public key file. You'll want to copy this to a platform like GitHub to give yourself SSH access.

```sh
$ view PUBLIC_KEY
```

e.g.

```sh
$ view ~/.ssh/id_rsa.pub
```

Or print the value.

```sh
$ cat ~/.ssh/id_rsa.pub
```

Copy to clipboard - on macOS.

```sh
$ pbcopy < ~/.ssh/id_rsa.pub
```

If the machine doesn't have an SSH key set, you'll have to _generate_ one - see below.


## Generate keys

How to generate a new SSH key pair.

_Note that GitHub dropped support for RSA so here we use Ed25519 algorithm instead. See [GitHub doc](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)._

First _navigate_ to the appropriate directory, to ensure the files get generated there.

```sh
$ mkdir ~/.ssh
$ cd ~/.ssh
```

Use the command below or see a bit further down for use with more flags.

Create the key pair:

```sh
$ ssh-keygen -t ed25519
```

If this is your first SSH key on the current machine, you can leave the location as the default and press enter.

```
Generating public/private rsa key pair.
Enter file in which to save the key (~/.ssh/id_ed25519):
```

That will use filenames as:

```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

Or, enter a custom name like `id_rsa_abc` and press enter.

You can press enter to skip through the rest of the options - unless you want to set a passphrase on the SSH key.

Flags:

- `-t ed25519`: Specifies the type of key to create. The possible values are “rsa1” for protocol version 1 and “dsa”, “ecdsa”, “ed25519”, or “rsa” for protocol version 2.
- `-b 4096`: Specifies the number of bits in the key to create.
- `-f ~/.ssh/foo.key`: Specifies the filename of the key file, if you don't want to set this in the REPL.
- `-C COMMENT`: A comment added to the end to help identify it.
  - Set as `your_email@example.com` as recommended by GitHub docs.
  - If you omit the flag, you'll get the default value, which looks like `"$USER@$HOSTNAME"` e.g. `michael@dell`. This makes sense if you want to use that machine name in your key contents as well as the name on GitHUb. And if you have multiple machines and want to identify them (rather than a single email address across machines). For security, should avoid using the same SSH key on multiple machines (which might be the temptation if you use the email as the identifier).

See also this SSH Public Key [tutorial](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key) on Git's docs, but that doesn't add much to what is covered above.

Your SSH key won't be enabled yet - see [Add key to SSH agent](#add-key-to-ssh-agent) section.


## Passphrase

Add a passphrase to your SSH key for added security.

### Set

Optional set a passphrase when prompted the creation step.

### Update

You can change the passphrase for an _existing_ private key without regenerating the key-pair by typing the following command:

```console
$ ssh-keygen -p
# Start the SSH key creation process
> Enter file in which the key is (/Users/you/.ssh/id_rsa): [Hit enter]
> Key has comment '/Users/you/.ssh/id_rsa'
> Enter new passphrase (empty for no passphrase): [Type new passphrase]
> Enter same passphrase again: [One more time for luck]
> Your identification has been saved with the new passphrase.
```

If your key already has a passphrase, you will be prompted to enter it before you can change to a new passphrase.

[source](https://help.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases)


## Add key to SSH agent

Note that may _not_ be necessary - if the agent is already running and if you are using the default SSH key name.

### 1. Start agent

Start the `ssh-agent` in the background.

```sh
$ eval "$(ssh-agent -s)"
```

Sample output - ignore this.

```
> Agent pid 59566
```

### 2. Add key

Add your SSH **private** key (without the suffix). to the `ssh-agent`.

```sh
$ ssh-add PRIVATE_KEY
```
e.g.

```sh
$ ssh-add ~/.ssh/id_rsa
```


## Configure SSH key for host

An alternative approach is to configure SSH to use a different SSH for a certain host like certain web server or GitHub server.

e.g.

```
Host example.com
    HostName example.com
    IdentityFile ~/.ssh/id_rsa_abc
```
