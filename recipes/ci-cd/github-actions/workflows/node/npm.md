# NPM actions
> Patterns for using Node.js and NPM in a GH Action workflow

{% raw %}

See GH docs - [Using Node.js with GitHub Actions](https://docs.github.com/en/actions/language-and-framework-guides/using-nodejs-with-github-actions). Some of the samples come from here.

Note use of this which comes from the doc linked above, but it is not used consistently in the docs - need to research what it does to test.

- `main.yml`
    ```yaml
    steps:
      - run: npm test
        env:
          CI: true
    ```

For building an app (such as React or Vue) and serving as a GH Pages site, see the [Deploy GH Pages](/recipes/ci-cd/github-actions/workflows/deploy-gh-pages/) cookbook section.


## Setup Node action

Note that the action environment **already** include Node.js, but using `actions/setup-node` gives more control.

See [Setup Node.js Environment](https://github.com/marketplace/actions/setup-node-js-environment) action.

> Setup a Node.js environment by adding problem matchers and optionally downloading and adding it to the PATH

### Options

<!-- TODO move to cheatsheets and link from here - similar to CLI usage guides this is actions usage -->

Sample from GH Actions recommendation. Note that `v2` does not work but `v2.1.1` and `v2-beta` are available (August 2020).

- `main.yml`
    ```yaml
    steps:
      - name: Setup Node.js environment
        uses: actions/setup-node@v2-beta
        with:
          # Set always-auth in npmrc
          always-auth: # optional, default is false

          # Version Spec of the version to use.  Examples: 12.x, 10.15.1, >=10.15.0
          node-version: # optional

          # Set this option if you want the action to check for the latest available version that satisfies the version spec
          check-latest: # optional

          # Optional registry to set up for auth. Will set the registry in a project level .npmrc and .yarnrc file, and set up auth to read in from env.NODE_AUTH_TOKEN
          registry-url: # optional

          # Optional scope for authenticating against scoped registries
          scope: # optional

          # Used to pull node distributions from node-versions.  Since there's a default, this is typically not supplied by the user.
          token: # optional, default is ${{ github.token }}

          # Deprecated. Use node-version instead. Will not be supported after October 1, 2019
          version: # optional
    ```


## Samples

### Basic

Use single Node.js version

I created this based on the other samples.

Note this uses [setup-node]() version while some of the other samples below are behind.

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - name: Use Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '14.x'

      - run: npm ci
      - run: npm run build --if-present
      - run: npm test
        env:
          CI: true
    ```

### Cache dependencies

This reduces build time as dependencies are cached between builds.

Sample from the docs.

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - name: Use Node.js
        uses: actions/setup-node@v1
        with:
          node-version: '12.x'

      - name: Cache Node.js modules
        uses: actions/cache@v2
        with:
          # npm cache files are stored in `~/.npm` on Linux/macOS
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
    name: Node.js CI

    on: [push]

    jobs:
      build:
        runs-on: ubuntu-latest

        strategy:
          matrix:
            node-version: [8.x, 10.x, 12.x]

        steps:
          - uses: actions/checkout@v2

          - name: Use Node.js ${{ matrix.node-version }}
            uses: actions/setup-node@v1
            with:
              node-version: ${{ matrix.node-version }}

          - run: npm install
          - run: npm run build --if-present
          - run: npm test
            env:
              CI: true
    ```


### Setup Node action default

From the Github Action samples:

- [Setup Node action](https://github.com/marketplace/actions/setup-node-js-environment) - `actions/setup-node`

- `main.yml`
    ```yaml
    # This workflow will do a clean install of node dependencies, build the source code and run tests across different versions of node
    # For more information see: https://help.github.com/actions/language-and-framework-guides/using-nodejs-with-github-actions

    name: Node.js CI

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
            node-version: [10.x, 12.x]

        steps:
          - uses: actions/checkout@v2

          - name: Use Node.js ${{ matrix.node-version }}
            uses: actions/setup-node@v1
            with:
              node-version: ${{ matrix.node-version }}

          - run: npm ci
          - run: npm run build --if-present
          - run: npm test
    ```

{% endraw %}
