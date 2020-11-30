# Actions for GH Pages
> A selection of Actions which both build a Jekyll site and publish it GH Pages, so you need one action instead of two

Here are some available actions in the marketplace.

I haven't tried all these out and there are a lot more in the marketplace, using different approaches and configurations. 


## Jekyll 4 Build Deploy

- [Marketplace](https://github.com/marketplace/actions/jekyll-4-build-deploy)


## Jekyll Deploy GH Pages

- [Marketplace](https://github.com/marketplace/actions/jekyll-deploy-gh-pages)


## Jekyll Actions

- [Marketplace](https://github.com/marketplace/actions/jekyll-actions) action

This will build a Jekyll site and publish to `gh-pages` branch for oyu.

The downsides of this action are:

- it does not work with `GITHUB_TOKEN` so is less secure and
- it uses Docker so can be slow (according to the README doc).

I have a demo which uses this action here [MichaelCurrin/jekyll-actions-quickstart](https://github.com/MichaelCurrin/jekyll-actions-quickstart)


## Jekyll Action TS

- [![limjh16 - jekyll-action-ts](https://img.shields.io/static/v1?label=limjh16&message=jekyll-action-ts&color=blue&logo=github)](https://github.com/limjh16/jekyll-action-ts)

This is fork of the one above. 

This uses TypeScript instead of Docker so should be quicker to download and handle non-default use-cases. Also, the action itself does not publish to GH Pages. For that, use an action like `peaceiris/actions-gh-pages` as below. 

Sample usage from the docs:

- `main.yml`
    ```yaml
    name: Build and deploy

    on:
      push:
        branches:
          - master

    jobs:
      jekyll:
        runs-on: ubuntu-latest
        steps:
          - name: 📂 Checkout
            uses: actions/checkout@v2

          - name: 💎 Setup ruby
            uses: ruby/setup-ruby@v1
            with:
              ruby-version: 2.7

          - name: 🔨 Install dependencies and build site
            uses: limjh16/jekyll-action-ts@v2
            with:
              enable_cache: true

          - name: 🚀 Deploy
            uses: peaceiris/actions-gh-pages@v3
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: _site
    ```
