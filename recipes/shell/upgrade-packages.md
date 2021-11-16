---
title: Upgrade packages
description: A convenient way to upgrade all your project packages with one command
---



## Related

- [Upgrade packages][] for a Node app using GitHub Actions for automation.

[Upgrade packages]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/node/upgrade-packages.md %}


## Configure

Set up in your shell config, such as `.bashrc`, `.zshrc`, or `.aliases`.

```sh
alias git-deps='git commit . -m "build(deps): upgrade packages"'

# Upgrade packages and commit them.
# Remember verify changes afterwards using a build or server command, or `git
# push` and a hook.
upgrade() {
  if [[ -n "$(git status --porcelain)" ]]; then
    echo 'ERROR: Working tree is not clean'

    return 1
  fi

  make upgrade

  if [[ -z "$(git status --porcelain)" ]]; then
    echo 'No upgrade changes to commit'

    return
  fi

  git-deps
}
```

If you don't use `make`, then replace `make upgrade` with your appropriate command.

e.g.

- NPM
    ```sh
    npm update
    ```
- Yarn
    ```sh
    yarn upgrade
    ```
- Ruby and Bundler
    ```sh
    bundle update
    ```


## Usage

Run this:

```sh
$ make upgrade
```

And test your app with commands like:

```sh
$ make build
$ make serve
$ git push
```

Replace your own commands like `npm run build`.

If upgrade specific package like with `npm install eslint@latest`, then you can commit that change with this:

```sh
$ git-deps
```

Assuming you don't have any unrelated change that would get unintentionally committed too.

