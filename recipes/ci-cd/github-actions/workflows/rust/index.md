---
title: Rust
description: Workflows for the Rust language
---

See [Rust](https://michaelcurrin.github.io/dev-resources/resources/rust/) in Dev Resources.


## Sample

### Standard

This is based on the default workflow that GH Actions recommends to you.

This uses Rust that is already set up in the enviroment.

- `main.yml`
    ```yaml
    name: Rust CI

    on:
      push:
        branches: [ main ]

      pull_request:
        branches: [ main ]

    env:
      CARGO_TERM_COLOR: always

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - name: Checkout 🛎️
          uses: actions/checkout@v4

        - name: Build 🏗️
          run: cargo build --verbose

        - name: Test 🚨
          run: cargo test --verbose
    ```
