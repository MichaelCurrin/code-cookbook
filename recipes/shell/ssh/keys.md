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

```sh
$ view ~/.ssh/id_rsa.pub
```

If the machine doesn't have an SSH key set, you'll have to generate one - see below.


## Generate keys

Generate a new SSH key. Press enter when prompted to use the default location.

Simple:

```sh
$ ssh-keygen -t rsa
```

As recommended by [GitHub doc](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), so you can push to GitHub repos via SSH.

```sh
$ ssh-keygen -t rsa -b 4096 -C COMMENT
```

Flags:

- `-t rsa`: Specifies the type of key to create. The possible values are “rsa1” for protocol version 1 and “dsa”, “ecdsa”, “ed25519”, or “rsa” for protocol version 2.
- `-b 4096`: Specifies the number of bits in the key to create
- `-f ~/.ssh/foo.key`: Specifies the filename of the key file.
- `-C COMMENT`: A comment added to the end to help identify. This could be `"your_email@example.com"` as recommended by GitHub docs or rather use `"$USER@$HOSTNAME"` as it is specific to your machine.

See also this SSH Public Key [tutorial](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key) on Git's docs, but that doesn't add much to what is covered above.


## Passphrase

Add a passphrase to your SSH key for added security.

### Set

Optional set a passphrase when prompted the creation step.

### Update

You can change the passphrase for an _existing_ private key without regenerating the keypair by typing the following command:

```sh
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


## Add key to agent

Note that may not be necessary if the agent is already running and if you are using the default SSH key name.

Start the `ssh-agent` in the background.

```sh
$ eval "$(ssh-agent -s)"
> Agent pid 59566
```

Add your SSH private key to the `ssh-agent`. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_rsa in the command with the name of your private key file.

```sh
$ ssh-add ~/.ssh/id_rsa
```
