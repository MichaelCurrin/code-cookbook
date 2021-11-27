# Cache gems and run

{% raw %}

Install using `cache` action and `actions/setup-ruby` action. 

Note, if you use `ruby/setup-ruby` instead, you get caching _already_. With the approach here, you get more control over cache and how Bundler runs, if that matters to you.

[![actions - cache](https://img.shields.io/static/v1?label=actions&message=cache&color=blue&logo=github)](https://github.com/actions/cache)

Based on [example](https://github.com/actions/cache/blob/master/examples.md#ruby---bundler).

- `main.yml`
    ```yaml
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2

      - name: Set up Ruby 💎
        uses: actions/setup-ruby@v1
        with:
          ruby-version: '2.7'

      - name: Get cached gems
        uses: actions/cache@v2
        with:
          path: vendor/bundle
          key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
          restore-keys: |
            ${{ runner.os }}-gems-

      - name: Install dependencies 🔧
        run: |
          bundle config set path vendor/bundle
          bundle install --jobs 4 --retry 3

      - name: Run
        run: bundle exec ruby hello.rb
    ```

{% endraw %}
