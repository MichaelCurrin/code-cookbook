# Jekyll


```toml
[build]
  command = "bundle exec jekyll build --trace"
  publish = "_site"

[build.environment]
  JEKYLL_ENV = "production"
```

You can just run `jekyll build` if you want - Netlify will still use `bundle` either way.

I like to use a `Makefile` with a `build` command set up, including the prod environment setting there. Then if I change the `Makefile`, I get the same change in both my local usage and remote builds.

```toml
[build]
  command = "make build"
  publish = "_site"
```
