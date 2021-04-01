# Use Ruby action and Bundler

{% raw %}
 
Here we setup a Ruby environment using the `setup-ruby` action. A param is passed to it so that it installed gems with Bundler and even caches them for you.

See the [GH Actions Ruby][] section for more info.

- `main.yml`
    ```yaml
    name: GH Pages deploy

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

          - name: Setup Ruby 💎
            uses: ruby/setup-ruby@v1
            with:
              ruby-version: '2.7'
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

Why use this this approach? This is a great generic approach, rather than being tied to using an action which is built around Jekyll or Jekyll + GH Pages. This Ruby action does the job well, it resusable across non-Jekyll projects and it will probably be simpler and better maintained than some Jekyll-specific one. Seeing as the Ruby one has wider appeal to community than a Jekyll solution.

{% endraw %}

[GH Actions Ruby]: {{ site.baseurl }}{% recipes/ci-cd/github-actions/workflows/ruby/index.md %}
