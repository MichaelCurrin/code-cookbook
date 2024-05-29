---
description: Patterns for using Node.js and NPM in a GH Actions workflow
---
# NPM

{% raw %}

See the GH docs page on [Using Node.js with GitHub Actions](https://docs.github.com/en/actions/language-and-framework-guides/using-nodejs-with-github-actions). Some of the samples come from here.

To build a Node app (such as React or Vue) and serve it with GH Pages, see the [Deploy GH Pages][] section of this cookbook site.

See [npm ci installs][] for use of `npm ci` instead of `npm install`.


## Set up Node action

Note that the action environment **already** include Node.js, but using `actions/setup-node` gives more control.

See [Set up Node.js Environment](https://github.com/marketplace/actions/setup-node-js-environment) action.

> Set up a Node.js environment by adding problem matchers and optionally downloading and adding it to the PATH


## Samples

### Basic

Use a single Node.js version of say `16`, `16.3.0`, or `lts/erbium` (NVM syntax).

I created this based on the other samples and the [setup-node](https://github.com/actions/setup-node) action README.

- `main.yml`
    ```yaml
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@master

      - name: Set up Node.js
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'npm'

      - name: Install dependencies
        run: npm

      - name: Test
        run: npm test
        env:
          CI: true

      - name: Build
        run: npm run build
    ```

### Cache dependencies

You can reduce build time if dependencies are cached between builds.

There are two recommended approaches here. Both require `package-lock.json` to be in version control. And both will cache tarballs in `~/.npm` - this is useful since `node_modules` get deleted by `npm ci` and so caching that would be useless.

#### Setup-node action cache

Built-in to `setup-node`, based on [doc](https://github.com/actions/setup-node#caching-packages-dependencies):

- `main.yml`
    ```yaml
    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Set up Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'npm'

      - name: Install dependencies
        run: npm ci
    ```

#### Cache action

Using a separate `cache` action, based on GH docs:

- `main.yml`
    ```yaml
    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Set up Node.js
        uses: actions/setup-node@v1
        with:
          node-version: '16'

      - name: Cache Node.js modules
        uses: actions/cache@v2
        with:
          path: ~/.npm
          key: ${{ runner.OS }}-node-${{ hashFiles('**/package-lock.json') }}
          restore-keys: |
            ${{ runner.OS }}-node-
            ${{ runner.OS }}-

      - name: Install dependencies
        run: npm ci
    ```


### Matrix

This sample comes from the docs and is similar to the default covered in the example after this.

- `main.yml`
    ```yaml
    name: Node CI

    on: push

    jobs:
      build:
        runs-on: ubuntu-latest

        strategy:
          matrix:
            node-version: [8, 10, 12]

        steps:
          - name: Checkout
            uses: actions/checkout@master

          - name: Set up Node.js ${{ matrix.node-version }}
            uses: actions/setup-node@v2
            with:
              node-version: ${{ matrix.node-version }}

          - name: Install dependencies
            run: npm install

          - name: Build
            run: npm run build

          - name: Test
            run: npm test
            env:
              CI: true
    ```


### Set up Node action default

From the GitHub Action samples:

- [Set up Node action](https://github.com/marketplace/actions/setup-node-js-environment) - `actions/setup-node`

- `main.yml`
    ```yaml
    name: Node CI

    on:
      push:
        branches: [ master ]
      pull_request:
        branches: [ master ]

    jobs:
      build:
        runs-on: ubuntu-latest

        strategy:
          matrix:
            node-version: [10, 12]

        steps:
          - uses: actions/checkout@v2

          - name: Use Node.js ${{ matrix.node-version }}
            uses: actions/setup-node@v2
            with:
              node-version: ${{ matrix.node-version }}

          - name: Install dependencies
            run: npm ci

          - name: Build
            run: npm run build --if-present

          - name: Test
            run: npm test
    ```

{% endraw %}

[Deploy GH Pages]: {% link recipes/ci-cd/github-actions/workflows/deploy-gh-pages/index.md %}
[npm ci installs]: {% link recipes/ci-cd/github-actions/workflows/node/ci-installs.md %}
