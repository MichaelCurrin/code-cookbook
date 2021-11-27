# CI installs
> A note on use of `npm ci`

Some flows here use the `npm ci` command - see [NPM CI cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/npm/commands/ci.html) to learn about the command.

A reason to **not** use is that it will delete `node_modules` if it exists. So if you use the `actions/cache` action to retrieved **cached** dependencies each time (for faster builds), make sure to use `npm install` rather than `npm ci`. Otherwise the cache is unused..

For more info on cache, see [Cache](/recipes/ci-cd/github-actions/workflows/cache.md) page of this Cookbook.

The equivalent for Yarn:

```sh
$ yarn install --frozen-lockfile
```
