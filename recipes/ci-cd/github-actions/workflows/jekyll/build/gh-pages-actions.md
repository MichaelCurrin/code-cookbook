---
description: Actions to build a Jekyll site then publish to GH Pages
---
# Actions for GH Pages

{% raw %}

A selection of Actions which both build a Jekyll site and publish to GH Pages. So you need one action instead of two - which can be a good and a bad thing.


## Warning

As appealing as the idea is to have on Action to handle both sides, it means you get locked into an action which might do too much. If you want to change how Jekyll installs or is built or how the publishing is handled, you are limited.

Compare with the approach where you handle Jekyll alone and then GH Pages alone. This means you can swap out the piece you need. And it also frees you up to change from Jekyll to another tool and still use the same generic GH Pages deploy flow.

## Actions

Here are some available actions in the marketplace.

I haven't tried all these out and there are a lot more in the marketplace, using different approaches and configurations. 

### Jekyll 4 Build Deploy

- [GH Marketplace](https://github.com/marketplace/actions/jekyll-4-build-deploy)

### Jekyll Deploy GH Pages

- [GH Marketplace](https://github.com/marketplace/actions/jekyll-deploy-gh-pages)

### Jekyll Actions

- [GH Marketplace](https://github.com/marketplace/actions/jekyll-actions) action

This will build a Jekyll site and publish to `gh-pages` branch for oyu.

The downsides of this action are:

- it does not work with `GITHUB_TOKEN` so is less secure and
- it uses Docker so can be slow (according to the README doc).

I have a demo which uses this action here [MichaelCurrin/jekyll-actions-quickstart](https://github.com/MichaelCurrin/jekyll-actions-quickstart)

Sample usage from the `README.md`. I modified to only handle push from the main branch.

Use GitHub Actions' cache to shorten build times and decrease load on servers

- `main.yml`
    ```yaml
    name: GH Pages deploy

    on:
      push:
        branches:
          - main

    jobs:
      jekyll:
        runs-on: ubuntu-latest

        steps:
        - name: Checkout
          uses: actions/checkout@v2

        - name: Cache dependencies
          uses: actions/cache@v1
          with:
            path: vendor/bundle
            key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
            restore-keys: |
              ${{ runner.os }}-gems-

        - name: Deploy to GitHub Pages
          uses:  helaili/jekyll-action@2.0.4
          env:
            JEKYLL_PAT: ${{ secrets.JEKYLL_PAT }}
    ```

{% endraw %}
