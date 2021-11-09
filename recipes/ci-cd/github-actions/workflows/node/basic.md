---
description: Simple Node.js workflow with GH Actions
---
# Basic

A simple CI flow to check and build a Node app using GitHub Actions.


## Commands

Here are the typical commands which are configured and run for a Node app.

```sh
$ npm install
$ npm run lint
$ npm run build
$ npm test
```

These should be run **locally** first. Then add them to an automated pipeline so they can run in the cloud.

You can of course leave out a step if it does not make sense for your app, but here I assume they are all needed and in this order.

If you prefer using `yarn` you can use it here and in the next section.


## Samples

### Standrd NPM sample

Add to your repo locally or using GitHub UI. Use any filename but the directory is important as `.github/workflows`.

- `main.yml`
    ```yaml
    name: Node CI

    on: push

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@master

          - name: Install 🔧
            run: npm install

          - name: Lint 🧐
            run: npm run lint

          - name: Build 🏗️
            run: npm run build

          - name: Test 🚨
            run: npm test
    ```

### Standad Yarn sample

- `main.yml`
    ```yaml
    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@master

          - name: Install 🔧
            run: yarn install

          - name: Lint 🧐
            run: yarn lint

          - name: Build 🏗️
            run: yarn build

          - name: Test 🚨
            run: yarn test
    ```

The assumption here is that the tests will be run against compiled JS files, so test is after build. But you could reverse those for some projects.

### NPX sample

If you want to run a CLI package without installing it, you can use `npx` like this:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@master
        
      - name: Lint 🧐
        run: npx eslint .
        
      - name: Check for updates 🧐
        run: npx npm-check-updates
```


## Actions used
> Which actions are used in the workflow above

This workflow uses `actions/checkout`, a standard action for cloning the repo in a workflow run.

Note that **no** Node or Yarn action was used here - the default environment will set up Node.js and Yarn for you. Using an extension is useful if you want to lock down a certain Node.js version or run multiple versions in parallel example. See the [node](node.md) sample's matrix area for more info.
