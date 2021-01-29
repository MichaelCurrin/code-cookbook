---
title: Ruby
logo: ruby
---

{% raw %}


## Samples

### Basic

[![actions - setup-ruby](https://img.shields.io/static/v1?label=actions&message=setup-ruby&color=blue&logo=github)](https://github.com/actions/setup-ruby)

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - uses: actions/setup-ruby@v1
        with:
          ruby-version: '2.7'

      - run: ruby hello.rb
    ```

### Cache dependencies

[![actions - cache](https://img.shields.io/static/v1?label=actions&message=cache&color=blue&logo=github)](https://github.com/actions/cache)

Based on [example](https://github.com/actions/cache/blob/master/examples.md#ruby---bundler).

- `main.yml`
    ```yaml
    - name: Get cached gems
      uses: actions/cache@v2
      with:
        path: vendor/bundle
        key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
        restore-keys: |
          ${{ runner.os }}-gems-

    - name: Install dependencies
      run: |
        bundle config set path vendor/bundle
        bundle install --jobs 4 --retry 3
    ```

{% endraw %}
