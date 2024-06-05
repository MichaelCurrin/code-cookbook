# Basic

This assumes no gems at all.

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
