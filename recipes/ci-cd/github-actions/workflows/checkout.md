---
title: Checkout
---

Repo: [Checkout](https://github.com/actions/checkout) action.

An action to checkout/clone your repo in your workflow. Almost all workflows will use this.

## Samples

### Basic

```yaml
steps:
  - name: 🛎 Checkout
    uses: actions/checkout@v2
```

### Fetch depth

You can customize it like this:

```yaml
steps:
  - name: 🛎 Checkout
    uses: actions/checkout@v2
    with:
      fetch-depth: 0
```

That will do a shallow clone to fetch only one commit, so is more efficient.

### Tokens

You can prevent your credentials from being persisted across multiple commands _within_ the workflow.

You **already** get GitHub auth token removed as part of post-job cleanup. So either way, your details are not persisted after the job run. I've seen this param recommended to set to avoid persisting after the job, but I don't think that can happen anyway.

From the docs:

> The auth token is persisted in the local git config. This enables your scripts to run authenticated git commands. The token is removed during post-job cleanup. Set `persist-credentials: false` to opt-out.
>
> `persist-credentials` - Whether to configure the token or SSH key with the local git config

```yaml
steps:
  - name: Checkout 🛎️
    uses: actions/checkout@v2
    with:
      persist-credentials: false
```
