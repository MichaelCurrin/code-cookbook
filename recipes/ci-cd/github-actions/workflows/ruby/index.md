---
title: Ruby
logo: ruby
---

{% raw %}


## Samples

### Basic

[![actions - setup-ruby](https://img.shields.io/static/v1?label=actions&message=setup--ruby&color=blue&logo=github)](https://github.com/actions/setup-ruby)

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - uses: actions/setup-ruby@v1
        with:
          ruby-version: '2.7'

      - run: ruby hello.rb
    ```

### Install dependencies 

From the docs, if you use `bundle-cache`, that means gems will be already for you (using `bundle install` and they will even be cached between builds. You can remove that option if you have no gems to install.

- `main.yml`
    ```yaml
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2

      - name: Setup Ruby 💎
        uses: actions/setup-ruby@v1
        with:
          ruby-version: '2.7'
          bundler-cache: true

      - name: Test by Ruby script
        run: bundle exec ruby hello.rb
    ```

### Install using cache action

This does the same as above, but is more verbose and has more control.

[![actions - cache](https://img.shields.io/static/v1?label=actions&message=cache&color=blue&logo=github)](https://github.com/actions/cache)

Based on [example](https://github.com/actions/cache/blob/master/examples.md#ruby---bundler).

- `main.yml`
    ```yaml
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2
    
      - name: Setup Ruby 💎
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
    ```

{% endraw %}
