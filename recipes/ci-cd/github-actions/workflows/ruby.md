# Ruby


## Samples

### Basic

[![actions - setup-ruby](https://img.shields.io/static/v1?label=actions&message=setup-ruby&color=blue&logo=github)](https://github.com/actions/setup-ruby)

- `main.yml`
    ```
    steps:
      - uses: actions/checkout@v2

      - uses: actions/setup-ruby@v1
        with:
          ruby-version: '2.7'

      - run: ruby hello.rb
    ```
    
### Cache dependencies

[![actions - cache](https://img.shields.io/static/v1?label=actions&message=cache&color=blue&logo=github)](https://github.com/actions/cache)

Using [example](https://github.com/actions/cache/blob/master/examples.md#ruby---bundler).

- `main.yml`
    ```yaml
    - uses: actions/cache@v2
      with:
        path: vendor/bundle
        key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
        restore-keys: |
          ${{ runner.os }}-gems-
    ```
