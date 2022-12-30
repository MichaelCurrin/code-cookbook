---
title: Deno
logo: deno
description: Run a GitHub Actions for a Deno app
---

{% raw %}

<!-- TODO update with learn to code and cheatsheet links -->

- [deno.land](https://deno.land/)
    > A secure runtime for JavaScript and TypeScript.

A different runtime for running server-side JS. Created by the author of Node.

It has a lot of benefits and doesn't use node modules and package.json but has its own system.

One day Deno could be the new Node.


## Samples

Here we use the [denoland/setup-deno](https://github.com/denoland/setup-deno) action.

### Basic

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - uses: denolib/setup-deno@v2
        with:
          deno-version: v1.x

      - run: |
          deno --version
          deno run https://deno.land/std/examples/welcome.ts
          deno install --allow-read -n deno_cat https://deno.land/std/examples/cat.ts
          deno_cat ./README.md
    ```

### Format and test

This will:

- Set up Deno in the environment...
- Use Deno to check formatting and run tests.

What's missing is a step build the app - to compile TS to JS and bundle as a single JS file (or binary). That would be useful for distributing a package or making a GH Pages site.

Here is the workflow:

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

### Recommended

Based on the file created for you when adding a new Deno workflow through the GitHub UI.

This will test across two Deno versions and will run on 3 operating systems.

See [denoland/setup-deno](https://github.com/denoland/setup-deno).

- `deno.yml`
    ```yaml
    name: Deno CI

    on:
      push:
        branches: [main]
      pull_request:
        branches: [main]

    jobs:
      test:
        runs-on: ${{ matrix.os }}

        strategy:
          matrix:
            os: [ubuntu-latest, macOS-latest, windows-latest]
            deno: ["v1.x", "nightly"]

        steps:
          - name: Set up repo
            uses: actions/checkout@v2

          - name: Set up Deno
            uses: denolib/setup-deno@c7d7968ad4a59c159a777f79adddad6872ee8d96
            with:
              deno-version: ${{ matrix.deno }}

          - name: Cache Dependencies
            run: deno cache deps.ts

          - name: Run Tests
            run: deno test -A --unstable
    ```

A variation without the matrix strategy. And using v2 instead of a commit hash.

- `deno.yml`
    ```yaml
    name: Deno CI

    on:
      push:
        branches:
          - main
      pull_request:
        branches:
          - main

    jobs:
      test:
        runs-on: ubuntu-latest

        steps:
          - name: Set up repo
            uses: actions/checkout@v2

          - name: Set up Deno
            uses: denolib/setup-deno@v2
            with:
              deno-version: v1.x

          - name: Cache Dependencies
            run: deno cache deps.ts

          - name: Run Tests
            run: deno test -A --unstable
    ```

{% endraw %}
