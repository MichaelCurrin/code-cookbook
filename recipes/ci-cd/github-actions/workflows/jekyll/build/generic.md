---
title: Generic
description: Use a Ruby action to set up Ruby and gems, then build and add a generic deploy step
---


## Related

- [GH Actions Ruby][] section.
- [jekyll-gh-actions-quickstart][] template repo with a live demo and tutorial.

[jekyll-gh-actions-quickstart]: https://github.com/MichaelCurrin/jekyll-gh-actions-quickstart
[GH Actions Ruby]: {% link recipes/ci-cd/github-actions/workflows/ruby/index.md %}


## Why generic?

Why use this this approach? This is a great generic approach, rather than being tied to using an action which is built around Jekyll or Jekyll + GH Pages.

The Ruby action does the job well, it reusable across non-Jekyll projects and it will probably be simpler and better maintained than some Jekyll-specific one. Seeing as the Ruby one has wider appeal to the community than a Jekyll-specifi solution.


## Sample

{% raw %}

Here we set up a Ruby environment using the `setup-ruby` action. A param is passed to it so that it installed gems with Bundler and even caches them for you.

- `main.yml`
    ```yaml
    name: GH Pages Deploy

    on:
      push:
        branches: main
        paths-ignore:
          - README.md

      pull_request:
        branches: main
        paths-ignore:
          - README.md

    jobs:
      build-deploy:
        name: Build and deploy

        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@v2

          - name: Set up Ruby 💎
            uses: ruby/setup-ruby@v1
            with:
              ruby-version: '3'
              bundler-cache: true

          - name: Build 🏗
            run: bundle exec jekyll build --trace

          - name: Deploy to GH Pages 🚀
            if: ${{ github.event_name != 'pull_request' }}
            uses: peaceiris/actions-gh-pages@v3
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: _site
    ```

Replace the Build command `make build` if you prefer.

{% endraw %}
