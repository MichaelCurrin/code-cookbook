# Node
> Sample workflows for building, testing and deploying a Node app using GitHub Actions

Both NPM and Yarn are covered here.


## Workflows in action

- [react-create-app-quickstart](https://github.com/MichaelCurrin/react-create-app-quickstart/blob/master/.github/workflows/main.yml) workflow using Yarn
- [preact-quickstart](https://github.com/MichaelCurrin/preact-quickstart/blob/master/.github/workflows/main.yml) workflow using NPM


## CI installs

### NPM

Some flows here use `npm ci` command - see [NPM CI cheatsheet](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/npm/commands/ci.html) to learn about the command.

A reason to **not** use is that it deletes `node_modules` if it exists. So if you use the `actions/cache` action to **cache** your dependencies each time for faster builds, make sure to use `npm install` to use the cached dependencies rather than deleting them.

For more info on cache, see [Cache](/recipes/ci-cd/github-actions/workflows/cache.md) page of this Cookbook.

### Yarn

The equivalent for Yarn:

```sh
$ yarn install --frozen-lockfile
```
