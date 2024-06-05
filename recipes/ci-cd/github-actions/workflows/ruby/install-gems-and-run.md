# Install gems and run

Use an action to set up Ruby, Ruby gems and then run a Ruby script.

This is using an action owned by the `ruby` GH account. Don't confuse with action of same name  owned by `actions` account.

[![ruby - setup-ruby](https://img.shields.io/static/v1?label=ruby&message=setup-ruby&color=blue&logo=github)](https://github.com/ruby/setup-ruby)

From the action's docs, if you use `bundle-cache` option, that means gems will be set up for you. It effectively does `bundle install` and then caches gems between builds. You can remove that option below, if you have no gems to install.

- `main.yml`
    ```yaml
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2

      - name: Set up Ruby 💎
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '2.7'
          bundler-cache: true

      - name: Run
        run: bundle exec ruby hello.rb
    ```

You can pass more options as environment variables, on the job or step.

```yaml
env:
  BUNDLE_JOBS: 4
  BUNDLE_RETRY: 3
```
