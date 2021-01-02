---
logo: deno
description: Run a GitHub Actions for a Deno app
---
# Deno

<!-- TODO update with learn to code and cheatsheet links -->

- [deno.land](https://deno.land/)
    > A secure runtime for JavaScript and TypeScript.

It's not a new language, just a different runtime for running server-side JS, created by the author of Node.

It has a lot of benefits and doesn't use node modules and package.json but has its own system.

One day Deno could be the new Node...


## Samples

This will:

- Setup Deno in the environment.
- Run Deno commands.

Here is the config:

- `main.yml`
    ```yaml
    name: CI

    on: [push, pull_request]

    jobs:
      build:
        name: Server tests

        runs-on: ubuntu-latest

        steps:
          - name: Checkout repo
            uses: actions/checkout@v2

          - name: Download deno
            uses: denolib/setup-deno@master
            with:
              deno-version: v1.1.2

          - name: Check format
            run: deno fmt --check

          - name: Run tests
            run: deno test --allow-read --allow-write
    ```
