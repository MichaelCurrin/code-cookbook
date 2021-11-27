---
title: Upgrade packages
description: Upgrade outdated NPM packages and make a PR with the lockfile changes
---

The workflow recipes on this page let you use GH Actions to upgrade your NPM dependencies automatically and safely, without touching the command-line.

Run the workflow a schedule or on a manual trigger and GH Actions will do the upgrade for you on a branch with a PR.

You'll get changes to your lock files (`package-lock.json` and `yarn.lock`) and also sometimes to `package.json` (when using `npm` but not when using `yarn`).


## Why?

The advantage is to stay up to date within the semantic versioning restrictions in `package.json`, such that you get updated direct dependencies and indirect dependencies. Thus avoiding bugs and vulnerabilities.

While taking the manual effort out of running manual tasks (upgrading locally, committing and checking if checks pass).

Especially useful if you frequently have to use dependabot to patch very nested indirect dependencies and upgrading a higher-level dependency reduces this.

This also effectively patches eagerly to newer versions even _before_ any vulnerabilities in old versions are discovered.


## Steps

### What the workflows do

1. Set up Node
1. Check for outdated packages that are still within the semvar restrictions (so hopefully no breaking changes in your app).
1. Upgrade packages.
1. Commit to a branch and create a PR. See [Create Pull Request][]

That should trigger a GH notification. Then you can review the PR changes yourself.


[Create Pull Request]: {% link recipes/ci-cd/github-actions/workflows/create-pull-request.md %}

### What you need to do

1. Pick one of the samples below, depending on basic/advanced and Node/Yarn.
1. Run the workflow manually on GH or on a schedule (such as weekly).
1. Review the PR.
1. If your usual CI test and build checks are passing, merge the PR. Or the close PR, then consider making up manual changes or just accept the old versions.


## Samples

Notes:

- We don't care whether `npm outdated` exits with success (nothing to update) or error status (something to update), but rather force a success and then check if the output is empty or not.
- Node is _already_ in the environment, but you get more control using the Set up Node step here.

### Basic

Here using a minimal approach.

Here's a PR I created when testing this: [vue-quickstart #9][]. It created a lockfile in this case but ideally one would be updated instead.

[vue-quickstart #9]: https://github.com/MichaelCurrin/vue-quickstart/pull/9

- `upgrade-packages.yml`
    ```yaml
    jobs:
      upgrade-packages:
        name: Upgrade packages

        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@v2

          - name: Set up Node.js ⚙️
            uses: actions/setup-node@v2
            with:
              node-version: '16.x'

          - name: Check for outdated packages
            run: |
              OUTDATED_OUTPUT=$(npm outdated) || true

          - name: Upgrade packages
            run: npm update

          - name: Commit and create PR
            uses: peter-evans/create-pull-request@v3
    ```

### Yarn

Yarn will be set up already in the environment.

So just change `npm` commands to use `yarn`.

- `upgrade-packages.yml`
    ```yaml
    steps:
      # ...

      - name: Check for outdated packages
        run: |
          OUTDATED_OUTPUT=$(yarn outdated) || true

      - name: Upgrade packages
        run: yarn upgrade

      - name: Commit and create PR
        uses: peter-evans/create-pull-request@v3
    ```

See [Yarn][] recipe for more help.

[Yarn]: {% link recipes/ci-cd/github-actions/workflows/node/yarn.md %}


### Advanced

In this one:

- Two run options
    - Manual
    - On a schedule (weekly on a Sunday a midnight here).
- we make sure the upgrade and PR steps are only attempts _if_ there is something to upgrade
- We also set custom inputs on the PR step.
- Use use cache to improve performance
    - Packages not yet installed will appear as `MISSING`. This is fine.
    - If you have packages installed already and loaded from cache (whether from the old or new `package.json` file, then the `npm install` and `npm update` will have less to do (at least when there is cache against the lockfile).

Here is a sample (using Yarn) - [PR #129](https://github.com/MichaelCurrin/badge-generator/pull/129).

{% raw %}

- `upgrade-packages.yml`
    ```yaml
    name: Upgrade NPM packages

    on:
      workflow_dispatch:

      schedule:
        - cron:  "0 0 * * 0"

    jobs:
      upgrade-packages:
        name: Upgrade packages

        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@v2

          - name: Set up Node.js ⚙️
            uses: actions/setup-node@v2
            with:
              node-version: '16.x'
              cache: 'npm'

          - name: Check for outdated packages 🔍
            id: vars
            run: |
              OUTDATED=$(npm outdated) || true

              if [[ -z "$OUTDATED" ]]; then
                echo 'Nothing to upgrade'
              else
                echo 'Found outdated packages:'
                echo "$OUTDATED"
              fi

              echo "::set-output name=outdated::$OUTDATED"

          - name: Upgrade packages ⏫
            if: ${{ steps.outdated.outputs.outdated != '' }}
            run: npm update

          - name: Commit and create PR 🔀
            if: ${{ steps.vars.outputs.outdated != '' }}
            uses: peter-evans/create-pull-request@v3
            with:
              title: 'build(deps): Upgrade NPM packages (automated)'
              branch: 'build-deps-upgrade-npm-packages-automated'
              commit-message: 'build(deps): upgrade NPM packages (automated)'
    ```

{% endraw %}

### Aggressive upgrade

Using `npm update` will only upgrade _within_ the semver version.

e.g. `^1.2.3` will allow `1.*.*` values after `1.2.3` but never major version changes like `2.*.*` or higher.

If you want to upgrade outside the restriction, at the risk of getting breaking changes (which are possibly **incompatible** with your codebase), you can use this approach.

Note we use [npm-check-updates][] which does _not_ actually install packages.

[npm-check-updates]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/package-versions/ncu.html

_Warning: untested_

{% raw %}

- `update-packages.yml`
    ```yaml
    steps:
      - name: Install NCU
        run: npm install -g npm-check-packages

      - name: Check for outdated packages
        id: vars
        run: |
          OUTDATED=$(ncu)

          if [[ -z $OUTDATED ]]; then
            echo 'Nothing to upgrade'
          else
            echo 'Found outdated packages:'
            echo "$OUTDATED"
          fi

          echo "::set-output name=outdated::$OUTDATED"

      - name: Upgrade packages
        if: ${{ steps.vars.outputs.outdated != '' }}
        run: ncu -u

      - name: Commit and create PR
        if: ${{ steps.vars.outputs.outdated != '' }}
        uses: peter-evans/create-pull-request@v3
    ```

{% endraw %}

TODO:

- Avoid capturing output because that probably loses colors. Rather use `-e 2` error mode and check status. `if ncu -e 2; then ...`

See [Package versions][] cheatsheet for more info on tools for upgrading.

[Package versions]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/package-versions/


## Notes

### Verify result with CI

This flow only upgrades the packages and puts it in your a branch and PR - then you use your own CI to verify.

ideally you have GH Actions or similar set up to run CI checks against your PR. This lets you keep your current process of quality control and keeps the automatic upgrade flow from doing too too much.

e.g.

1. lint
1. test
1. compile TypeScript
1. build app

### Lockfile

The flow is intended for if you already have a lockfile, so that it can updated. In the section below, a `package-lock.json` file will be created if one does not exist.

NPM CLI will update the lockfile. But the `package.json` won't be affected.

But Yarn will _also_ update the version in `package.json`.
