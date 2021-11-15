---
title: Upgrade packages
description: Upgrade outdated NPM packages and make a PR with the lockfile changes
---

The aim of these recipes is to upgrade dependencies in `package-lock.json`.


This could be run on a schedule or on a manual trigger.

## Why?

The advantage is to stay up to date within the semantic versioning restrictions in `package.json`, such that you get updated direct dependencies and indirect dependencies. Thus avoiding bugs and vulnerabilities.

While taking the manual effort out of running manual tasks (upgrading locally, committing and checking if checks pass).

Especially useful if you frequently have to use dependabot to patch very nested indirect dependencies and upgrading a higher-level dependency reduces this.

This also effectively patches eagerly to newer versions even _before_ any vulnerabilities in old versions are discovered.


## Steps in the workflow

1. Set up Node
1. Check for outdated packages.
1. Upgrade packages.
1. Commit to a branch and create a PR. See [Create Pull Request][]

That should trigger a GH notification. Then you can review the PR changes yourself.


[Create Pull Request]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/create-pull-request.md %}


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

[Yarn]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/node/yarn.md %}


### Advanced

In this one:

- Run manually and on schedule (weekly).
- we make sure the upgrade and PR steps are only attempts _if_ there is something to upgrade
- We also set custom inputs on the PR step.
- Use use cache to improve performance
    - Packages not yet installed will appear as `MISSING`. This is fine.
    - If you have packages installed already and loaded from cache (whether from the old or new `package.json` file, then the `npm install` and `npm update` will have less to do (at least when there is cache against the lockfile).

_Warning: untested_

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
            if: ${{ steps.vars.outputs.outdated != '' }}
            run: npm update

          - name: Commit and create PR 🔀
            if: ${{ steps.vars.outputs.outdated != '' }}
            uses: peter-evans/create-pull-request@v3
            with:
              title: 'Upgrade NPM packages (automated)'
              branch: 'deps-upgrade-npm-packages-automated'
              commit-message: 'build(deps): upgrade NPM dependencies (automated)'
    ```

{% endraw %}

### Aggressive upgrade

Using `npm update` will only upgrade _within_ the semver version.

e.g. `^1.2.3` will allow `1.*.*` values after `1.2.3` but never major version changes like `2.*.*` or higher.

If you want to upgrade outside the restriction, at the risk of getting breaking changes (which are possibly **incompatible** with your codebase), you can use this approach.

Note we use [npm-check-updates][] which does _not_ actually install packages.

[npm-check-updates][]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/package-versions/ncu.html

_Warning: untested_

{% raw %}

- `update-packages.yml`
    ```yaml
    steps:
      - name: Install NCU
        run: npm install -g npm-check-packages

      - name: Check for outdated packages
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
