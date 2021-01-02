---
logo: deno
description: Run a GitHub Actions for a Deno app
---
# Deno

<!-- TODO update with learn to code and cheatsheet links -->

- [deno.land](https://deno.land/)
    > A secure runtime for JavaScript and TypeScript.

A different runtime for running server-side JS. Created by the author of Node.

It has a lot of benefits and doesn't use node modules and package.json but has its own system.

One day Deno could be the new Node.


## Samples

This will:

- Setup Deno in the environment.
- Use Deno to check formatting and run tests.

What's missing is a build step to compile TS to JS and bundle as a single JS file. That would be useful for distributing a package or making a GH Pages site.

Here is the config:

- `main.yml`
    ```yaml
    name: Deno CI

    on:
      push:
      pull_request:

    jobs:
      build:
        name: Test app

        runs-on: ubuntu-latest

        steps:
          - name: Checkout repo
            uses: actions/checkout@v2

          - name: Download Deno
            uses: denolib/setup-deno@master
            with:
              deno-version: v1.1.2

          - name: Check format
            run: deno fmt --check

          - name: Run tests
            run: deno test --allow-read --allow-write
    ```
