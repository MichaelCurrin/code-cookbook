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
          uses: actions/checkout@v2
        
        - name: Build 🏗️ 
          run: cargo build --verbose
          
        - name: Test 🚨
          run: cargo test --verbose
    ```
 

### Simple Infra

This uses an Action is maintained by the Rust team.

The [simple-ci](https://github.com/rust-lang/simpleinfra/tree/master/github-actions/simple-ci) action, from the `rust-lang/simpleinfr` repo.

> This builds, tests, and checks the formatting of your project.

- `main.yml`
    ```yaml 
    name: Rust CI

    on:
      push:
        branches: [main]
        paths-ignore:
          - "docs/**"

      pull_request:
        branches: [main]
        paths-ignore:
          - "docs/**"

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v2

          - name: Set up Rust 🦀
            uses: rust-lang/simpleinfra/github-actions/simple-ci@master
            with:
              check_fmt: true
```
