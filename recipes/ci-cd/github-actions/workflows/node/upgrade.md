---
title: Upgrade
description: Upgrade NPM packages and make a PR with the changes
---

This could be run on a schedule or on a manual trigger.

## Steps

1. Set up Node
1. Attempt to upgrade packages.
1. Check if there is anything to commit.
1. Commit to a branch and create a PR.

Once than then review the PR changes.

And ideally you have GH Actions or similar set up to run CI checks against your PR. This lets you keep your current process of quality control and keeps the automatic upgrade flow from doing too too much.

e.g.

1. lint
1. test
1. compile TypeScript
1. build app

