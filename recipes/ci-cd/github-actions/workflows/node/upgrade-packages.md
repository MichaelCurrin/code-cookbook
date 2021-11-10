---
title: Upgrade packages
description: Upgrade NPM packages and make a PR with the changes
---

This could be run on a schedule or on a manual trigger.


## Steps

1. Set up Node
1. Attempt to upgrade packages.
1. Check if there is anything to commit.
1. Commit to a branch and create a PR.

Once than then review the PR changes.

Here's a PR I created when testing: [#9 in vue-quickstart](https://github.com/MichaelCurrin/vue-quickstart/pull/9). It created a lockfile but ideally one would be updated.

### Verify result with CI

And ideally you have GH Actions or similar set up to run CI checks against your PR. This lets you keep your current process of quality control and keeps the automatic upgrade flow from doing too too much.

e.g.

1. lint
1. test
1. compile TypeScript
1. build app

### Lockfile

The flow is intended for if you already have a lockfile, so that it can updated. In the section below, a `package-lock.json` file will be created if one does not exist.

NPM CLI will update the lockfile. But the `package.json` won't be affected.

But Yarn will _also_ update the version in `package.json`.


## Sample

Note that Node.js is _already_ in the environment, but you get more control using the Set up Node step here.

```yaml
name: Upgrade NPM packages

on: workflow_dispatch

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
          OUTDATED=$(npm outdated) || true
        
      - name: Upgrade packages
        run: npm update
        
      - name: Commit and create PR
        uses: peter-evans/create-pull-request@v3
```

TODO: 

- Only create PR on something to commit.
- Add Yarn support.
- Add cron schedule.
- Add branch name based on datetime maybe.
- Create variation using NCU for more aggressive check of what can be upgraded past breaking versions, and then actually perform.
