---
title: Rust
description: Workflows for the Rust language
---

See [Rust](https://www.rust-lang.org/) homepage.

See also [Rust](https://github.com/MichaelCurrin/learn-to-code/tree/master/en/topics/scripting_languages/Rust) guide in my Learn to Code project.


## Sample

This is based on the default workflow the GH Actions recommends to you.

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
        - uses: actions/checkout@v2
        
        - name: Build
          run: cargo build --verbose
          
        - name: Run tests
          run: cargo test --verbose
    ```
