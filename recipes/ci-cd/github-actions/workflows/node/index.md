---
layout: listing
logo: node-dot-js
---
# Node.js
> Sample workflows for building, testing and deploying a Node.js app using GitHub Actions

Both NPM and Yarn are covered here.

See [Building and testing Node.js](https://docs.github.com/en/free-pro-team@latest/actions/guides/building-and-testing-nodejs) in the GH Actions docs.


## Workflows in action

- [MichaelCurrin/react-quickstart](https://github.com/MichaelCurrin/react-quickstart/blob/master/.github/workflows/main.yml) workflow, using Yarn.
- [MichaelCurrin/preact-quickstart](https://github.com/MichaelCurrin/preact-quickstart/blob/master/.github/workflows/main.yml) workflow, using NPM.


## CI installs

### NPM

Some flows here use the `npm ci` command - see [NPM CI cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/npm/commands/ci.html) to learn about the command.

A reason to **not** use is that it will delete `node_modules` if it exists. So if you use the `actions/cache` action to retrieved **cached** dependencies each time (for faster builds), make sure to use `npm install` rather than `npm ci`. Otherwise the cache is unused..

For more info on cache, see [Cache](/recipes/ci-cd/github-actions/workflows/cache.md) page of this Cookbook.

### Yarn

The equivalent for Yarn:

```sh
$ yarn install --frozen-lockfile
```
