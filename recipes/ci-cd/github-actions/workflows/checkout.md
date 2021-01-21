---
title: Checkout
---

Repo: [Checkout V2](https://github.com/actions/checkout) action.

An action to checkout/clone your repo in your workflow. Almost all workflows will use this.

```yaml
steps:
  - name: 🛎 Checkout
    uses: actions/checkout@v2
```

You can customize it like this:

```yaml
steps:
  - name: 🛎 Checkout
    uses: actions/checkout@v2
    with:
      fetch-depth: 0
```

That will do a shallow clone to fetch only one commit, so is more efficient.
