# Install gems and run

Using an action owned by `ruby` account. Don't confuse with action of same name  owned by `actions` account.

[![ruby - setup-ruby](https://img.shields.io/static/v1?label=ruby&message=setup-ruby&color=blue&logo=github)](https://github.com/ruby/setup-ruby)

From the action's docs, if you use `bundle-cache`, that means gems will be already for you (using `bundle install` and they will even be cached between builds. You can remove that option if you have no gems to install.

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

Pass options as environment variables on the job or step.

```yaml
env:
  BUNDLE_JOBS: 4
  BUNDLE_RETRY: 3
```
