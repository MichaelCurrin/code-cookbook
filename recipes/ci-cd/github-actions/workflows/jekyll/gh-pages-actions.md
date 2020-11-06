# GH Pages Actions
> Build a Jekyll site and publish to GH Pages using a single action

Here are some available actions in the marketplace.

I haven't tried all these out and there are a lot more in the marketplace, using different approaches and configurations. 


## Jekyll 4 Build Deploy

- [Marketplace](https://github.com/marketplace/actions/jekyll-4-build-deploy)


## Jekyll Actions

- [Marketplace](https://github.com/marketplace/actions/jekyll-actions) action

The downsides of this action are:

- it does not work with `GITHUB_TOKEN` so is less secure and
- it uses Docker so can be slow (according to the README doc).

I have a demo which uses this action here [MichaelCurrin/jekyll-actions-quickstart](https://github.com/MichaelCurrin/jekyll-actions-quickstart)


## Jekyll Action TS

[repo](https://github.com/limjh16/jekyll-action-ts)

This is fork of the one above. It uses TypeScript instead of Docker so should be quicker to download and handle non-default use-cases.

Sample usage from the docs:

```yaml
name: Build and deploy Jekyll site

on:
  push:
    branches:
      - master

jobs:
  jekyll:
    runs-on: ubuntu-latest
    steps:
      - name: 📂 Setup
        uses: actions/checkout@v2

        # Include the lines below if you are using jekyll-last-modified-at
        # or if you would otherwise need to fetch the full commit history
        # however this may be very slow for large repositories!
        # with:
        #   fetch-depth: '0'

      - name: 💎 Setup ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: 2.7

      - name: 🔨 Install dependencies and build site
        uses: limjh16/jekyll-action-ts@v2
        with:
          enable_cache: true
```
