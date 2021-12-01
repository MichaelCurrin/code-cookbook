---
title: Upgrade packages
description: Upgrade outdated NPM packages and make a PR with the lockfile changes
---

## About

The workflow recipes on this page let you use GH Actions to upgrade your NPM dependencies automatically and safely, without touching the command-line.

Run the workflow a schedule or on a manual trigger and GH Actions will do the upgrade for you on a branch with a PR.

You'll get changes to your lock files (`package-lock.json` and `yarn.lock`) and also sometimes to `package.json` (when using `npm` but not when using `yarn`).


## Why?

The advantage is to stay up to date within the semantic versioning restrictions in `package.json`, such that you get updated direct dependencies and indirect dependencies. Thus avoiding bugs and vulnerabilities.

While taking the manual effort out of running manual tasks (upgrading locally, committing and checking if checks pass).

Especially useful if you frequently have to use dependabot to patch very nested indirect dependencies and upgrading a higher-level dependency reduces this.

This also effectively patches eagerly to newer versions even _before_ any vulnerabilities in old versions are discovered.


## Related

- [Upgrade packages][] cheatsheet for NPM.

[Upgrade packages]: https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/package-managers/javascript/npm/upgrade-packages.html


## Steps

### What the workflows do

1. Set up Node
1. Check for outdated packages that are still within the semvar restrictions (so hopefully no breaking changes in your app).
1. Upgrade packages.
1. Commit to a branch and create a PR. See [Create Pull Request][] recipes.

That should trigger a GH notification. Then you can review the PR changes yourself.


[Create Pull Request]: {% link recipes/ci-cd/github-actions/workflows/create-pull-request.md %}

### What you need to do

1. Pick one of the samples below, depending on basic/advanced and Node/Yarn.
1. Run the workflow manually on GH or on a schedule (such as weekly).
1. Get your CI checks to run on the PR.
1. Chekck your standard CI checks are passing (such as to build and test the app).
1. Decide what to do with the PR.
    - Merge and review the PR.
    - Update the code your self with the same PR or a new PR. e.g. if two packages were upgraded and one causes an error, then downgrade that one.
    - Or close the PR and just accept the old versions of packages.


Note on the last part around CI checks running:

- Normally these checks would run on creation of the PR.
- For security reasons on GitHub's side, the PR/branch created GH Actions _cannot_ cause workflows to run. See [issue](https://github.com/peter-evans/create-pull-request/issues/48).
- Even if your Approve the workflow. There _is_ an "Approve and Run" button that appears in PRs to trigger checks, but this only works across _forks_. There are 
- The workarounds I have:
    - Just to make a non-functional commit, like adding a space to the package lockfile. When I commit that in GitHub, then the checks run. 
    - Alternatively you can close the PR and make a new one against the branch that the workflow made - this works but isn't so clean.
    - Or for a larger change, you can add the build and test steps to the upgrade packages workflow, so that it covers everything. It just becomes longer and more  project-specific.


## Samples

Note that Node is _already_ in the environment, but you get more control using the _Set up Node_ step here, like picking a Node version.

### Basic

Here using a minimal approach.

Two run options:

- Manual - trigger from within Actions tab.
- On a schedule (weekly on a Sunday a midnight here).

The PR step will do nothing if there is nothing to commit.

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

          - name: Upgrade packages 🔀
            run: npm update

          - name: Commit and create PR 🔀
            uses: peter-evans/create-pull-request@v3
    ```

### Use Yarn

Yarn will be set up already in the environment, so no need to add a step to install Yarn.

So just change `npm` commands to use `yarn`.

- `upgrade-packages.yml`
    ```yaml
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2

      - name: Set up Node.js ⚙️
        uses: actions/setup-node@v2
        with:
          node-version: '16.x'

      - name: Check for outdated packages 🔍
        run: |
          OUTDATED_OUTPUT=$(yarn outdated) || true

      - name: Upgrade packages 🔀
        run: yarn upgrade

      - name: Commit and create PR 
        uses: peter-evans/create-pull-request@v3
    ```

See [Yarn][] recipe for more help.

[Yarn]: {% link recipes/ci-cd/github-actions/workflows/node/yarn.md %}

### Advanced

In this one:

- Use _cache_ to improve performance.
    - Packages not yet installed will appear as `MISSING`. This is fine.
    - If you have packages installed already and loaded from cache (whether from the old or new `package.json` file, then the `npm install` and `npm update` will have less to do (at least when there is cache against the lockfile).
- We make sure the upgrade and PR steps are only attempts _if_ there is something to upgrade.
    - We don't care whether `npm outdated` exits with success (nothing to update) or error status (something to update), but rather force a success and then check if the output is empty or not.
- We set custom parameters on the PR step.

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

_Warning: untested._

{% raw %}

- `update-packages.yml`
    ```yaml
    steps:
      - name: Install NCU 🔧
        run: npm install -g npm-check-packages

      - name: Check for outdated packages 🔍
        id: vars
        run: |
          if ncu -e 2; then
            IS_OUTDATED=true
            echo 'Nothing to upgrade'
          else
            IS_OUTDATED=false
            echo 'Found outdated packages:'
          fi

          echo "::set-output name=is_outdated::$IS_OUTDATED"

      - name: Upgrade packages ⏫
        if: ${{ steps.vars.outputs.is_outdated == 'true' }}
        run: ncu -u

      - name: Commit and create PR 🔀
        if: ${{ steps.vars.outputs.is_outdated == 'true' }}
        uses: peter-evans/create-pull-request@v3
    ```

Or simplify like this. The PR step will do nothing if there are no changes.

- `update-packages.yml`
    ```yaml
    steps:
      - name: Install NCU 🔧
        run: npm install -g npm-check-packages
        
      - name: Upgrade packages ⏫
        run: ncu -u
        
      - name: Commit and create PR 🔀
        uses: peter-evans/create-pull-request@v3
    ```


{% endraw %}

See [Package versions][] cheatsheet for more info on tools for upgrading.

[Package versions]: https://michaelcurrin.github.io/dev-resources/resources/javascript/packages/package-versions/


## Run checks within upgrade workflow

Build on the basic workflow, but with checks running in the workflow.

Note that it running any linting and formatting steps is still useful here, because your workflow might actually upgrade ESLint or Prettier, even if your codebase stays unchanged.

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

          - name: Check for outdated packages 🔍
            run: |
              OUTDATED_OUTPUT=$(npm outdated) || true

          - name: Upgrade packages ⏫
            run: npm update
       
         - name: Lint 🧐
           run: npm run lint:check
            
          - name: Test 🚨
            run: npm test
          
          - name: Build 🏗️
            run: npm run build

          - name: Commit and create PR
            uses: peter-evans/create-pull-request@v3
    ```

Note that update step will also _install_ packages, so you can omit `npm install` as a step.


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
