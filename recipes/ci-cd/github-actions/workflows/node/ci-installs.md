# CI installs
> A note on use of `npm ci`

Some flows in pages here use the `npm ci` command. This can be safer deploy pipelines. See [NPM CI cheatsheet][] to learn about the command.


## Cache concerns

A reason to **not** use is that it will **delete** `node_modules` if it exists.

So if you use the `actions/cache` action to retrieved **cached** dependencies each time (for faster builds), make sure to use `npm install` rather than `npm ci`. Otherwise the cache is unused. There is then a risk that packages could get upgraded

For more info on cache, see [Cache][] page of this Cookbook.

You can also solve this issue by caching the tarballs in `~/.npm` rather than `node_modules`. This will safe downloading packages and still let `node_modules` get built each time.

[NPM CI cheatsheet]: https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/package-managers/javascript/npm/commands/ci.html
[Cache]: {% link recipes/ci-cd/github-actions/workflows/cache.md %}
