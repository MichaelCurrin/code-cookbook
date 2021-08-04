# Use cURL
> Install applications using cURL


Install an application by running a remote script in the terminal. Download the script with `curl` and pass it to a shell to run.


## Command usage

### Recommended flags

| Flag               | Description                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-o`               | Output location. This used sometimes as `-o-` but I don't know why.                                                                                                                                                                                                                                                                                                                     |
| `-f, --fail`       | _(HTTP)  Fail  silently  (no  output at all) on server errors. This is mostly done to better enable scripts etc to better deal with failed attempts. In normal cases  when  a  HTTP  server  fails  to deliver  a  document,  it  returns an HTML document stating so (which often also describes why and more). This flag will prevent curl from outputting that and return error 22._ |
| `-s, --silent`     | _Silent or quiet mode. Don't show progress meter or error messages.  Makes Curl mute._                                                                                                                                                                                                                                                                                                  |
| `-S, --show-error` | _When used with -s it makes curl show an error message if it fails._                                                                                                                                                                                                                                                                                                                    |
| `-L, --location`   | Follow redirect to a different location.                                                                                                                                                                                                                                                                                                                                                |

### Shell

There is no consistency in the instructions on documentation for applications. As you'll see in [Examples](#examples), some use `sh`, or `bash`. Some use `-` as an argument and some don't.

| Flag | Description                                                                                                                                                                                                                                          |
| ---- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-E` | preserve environment variables.                                                                                                                                                                                                                      |
| `-s` | _If the `-s` option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell._ `curl ... | bash -s` |


## Examples

These are copied from installation instructions of various tools. They use different approaches and some of them show similarities.

A combination of the best of each approach should be used for new projects.

### Install using Bash

#### Deno

```sh
$ curl -fsSL https://deno.land/x/install/install.sh | sh
```

#### Node.js

Setting up a Debian source.

```sh
$ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
```

Or as root.

```sh
$ curl -sL https://deb.nodesource.com/setup_14.x | bash -
```

#### Yarn

[Yarn](https://classic.yarnpkg.com/en/docs/install#mac-stable)

```sh
curl -o- -L https://yarnpkg.com/install.sh | bash
```

Or specify a version.

```sh
$ curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version [version]
```

#### Homebrew

[Homebrew](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

#### Datadog

```sh
bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"
```

#### GitHub actions

```sh
curl -O -L https://github.com/actions/runner/releases/download/v2.168.0/actions-runner-linux-x64-2.168.0.tar.gz
```

#### Rust

```sh
curl https://sh.rustup.rs -sSf | sh
```


### Install using Python

#### Poetry

From [Poetry](https://github.com/python-poetry/poetry) repo

```sh
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```
