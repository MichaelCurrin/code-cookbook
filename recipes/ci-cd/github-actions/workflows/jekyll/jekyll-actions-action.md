# Use the Jekyll Actions action

- [![limjh16 - jekyll-action-ts](https://img.shields.io/static/v1?label=limjh16&message=jekyll-action-ts&color=blue&logo=github)](https://github.com/limjh16/jekyll-action-ts)

This is fork of [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action, with the differences that the fork is built in TS not Docker and it doesn't to publish for you (the docs add a step for publishing) 

Which is great. As it means this Jekyll action has a narrow scope and it is also easy to add an extra step to publish to GH Pages. The docs recommend a popular action by PeaceIris, as shown in the last step below.

It appears you have to first setup Ruby and then use this Jekyll-related action.

This uses TypeScript instead of Docker, so is supposed should be quicker to download than the original action. It also is more flexible to handle non-default use-cases.

Sample usage based on the docs.

{% raw %}

- `main.yml`
    ```yaml
    name: Build and deploy

    on:
      push:
        branches:
          - master

    jobs:
      jekyll:
        name: Build and deploy

        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎
            uses: actions/checkout@v2

          - name: Setup Ruby 💎
            uses: ruby/setup-ruby@v1
            with:
              ruby-version: 2.7

          - name: Install dependencies and build site 🔨
            uses: limjh16/jekyll-action-ts@v2
            with:
              enable_cache: true

          - name: Deploy to GH Pages 🚀
            if: ${{ github.event_name != 'pull_request' }}
            uses: peaceiris/actions-gh-pages@v3
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: _site
    ```

{% endraw %}
