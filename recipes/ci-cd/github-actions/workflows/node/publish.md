---
description: Publish a Node package to GitHub or NPM
---
# Publish


## Samples


### Use NPM Publish

Examples from [Publishing Node.js packages](https://docs.github.com/en/free-pro-team@latest/actions/guides/publishing-nodejs-packages) in the GH Actions docs. There is an example there for Yarn too.

See also [About packaging with GitHub Actions](https://docs.github.com/en/free-pro-team@latest/actions/guides/about-packaging-with-github-actions).

- Publish to NPM - `main.yml`
    ```yaml
    name: Node.js Package

    on:
      release:
        types: [created]

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - uses: actions/checkout@v2

        # Setup .npmrc file to publish to npm
        - uses: actions/setup-node@v1
          with:
            node-version: '12.x'
            registry-url: 'https://registry.npmjs.org'

        - run: npm install

        - run: npm publish
          env:
            NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
    ```
- Publish to GitHub - `main.yml`
    ```yaml
    name: Node.js Package

    on:
      release:
        types: [created]

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - uses: actions/checkout@v2

        # Setup .npmrc file to publish to GitHub Packages
        - uses: actions/setup-node@v1
          with:
            node-version: '12.x'
            registry-url: 'https://npm.pkg.github.com'
            # Defaults to the user or organization that owns the workflow file
            scope: '@octocat'

        - run: npm install

        - run: npm publish
          env:
            NODE_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```

### Semantic release

See [semantic-release/semantic-release](https://github.com/semantic-release/semantic-release) and [docs](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#repositoryurl).

> semantic-release automates the whole package release workflow including: determining the next version number, generating the release notes and publishing the package.


Based on workflow in [Presite](https://github.com/egoist/presite).

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node-version }}

      - run: npm install

      - run: npm test

      - run: npx semantic-release
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
    ```
