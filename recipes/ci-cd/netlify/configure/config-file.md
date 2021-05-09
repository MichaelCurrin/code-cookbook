# Netlify config file

Netlify's config file is `netlify.toml`.

It should be at the root of the repo. Indentation should be two spaces. Just push your `master` branch from your machine or edit on GitHub and a Netlify build will run using your config settings.

For Jekyll, make sure to add it to `exclude` in your config, to avoid adding it to your `_site` directory.

```yaml
exclude:
  - LICENSE
  - README.md
  - Makefile
  - netlify.toml
```

The minimum config two params under `[build]` as below.

- `command` - what shell command to run to build the app (dependencies are already installed by then)
- `publish` - which output directory to serve as a site. This directory is usually unversioned in git.
