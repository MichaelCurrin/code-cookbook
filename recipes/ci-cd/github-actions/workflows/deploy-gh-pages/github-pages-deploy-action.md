---
title: GitHub Pages Deploy action by JamesIves
description: Deploy your static output directory on the GH Pages branch
---

Action:

- [GitHub Pages Deploy Action](https://github.com/marketplace/actions/deploy-to-github-pages) - `JamesIves/github-pages-deploy-action`
    >  This GitHub Action will automatically deploy your project to GitHub Pages. It can be configured to push your production-ready code into any branch you'd like, including `gh-pages` and `docs`. It can also handle cross repository deployments too. 

## Usage

Add this to your steps:

```yaml
- name: Deploy 🚀
  uses: JamesIves/github-pages-deploy-action@releases/v3
  with:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    BRANCH: gh-pages
```

To build your project, add steps before, as in the one job sample below.

Or add this after `BRANCH`, as in the second sample below.

```yaml
BUILD_SCRIPT: yarn install && yarn build
```


## Samples

### One job

Here we deploy a Node project with NPM - this sample is based on that action's sample.

It uses:

- `actions/checkout`
- `JamesIves/github-pages-deploy-action`
- `npm`

Note from action:

> If you're using actions/checkout@v2 you must set persist-credentials to false in most cases for the deployment to work correctly.

Workflow file:

```yaml
name: Build and Deploy

on: push

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@v2
        with:
          persist-credentials: false

      - name: Install 🔧
        run: npm install

      - name: Build 🏗️
        run: npm run build

      - name: Deploy 🚀
        uses: JamesIves/github-pages-deploy-action@releases/v3
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          BRANCH: gh-pages
```

Notes:

- `with` is used here but `env` in the example below - does that matter?
- `actions/setup-node` is not used.
- Some more emojis to use: `⚙️ 🧱`
- If you're using `actions/checkout@v2` you must set persist-credentials to false in most cases for the deployment to work correctly.
- The branch is _required_.
- Tests are missing. See example below.


### Two jobs

Install, test and deploy using two jobs.

Here we use Yarn and several versions of Node test the app and then one version of Node to deploy a React app.

From [explooosion/react-build-with-github-actions](https://github.com/explooosion/react-build-with-github-actions).

Uses:

- `actions/checkout`
- `actions/setup-node` (tests only)
- `JamesIves/github-pages-deploy-action`
- `yarn`


Workflow file:

```yaml
name: Build and Deploy

on:
  push:
    branches:
      - master
      
jobs:
  install-and-test:
    runs-on: ubuntu-latest
    
    strategy:
      matrix:
        node-version: [8.x, 10.x, 12.x]
        
    steps:
      - uses: actions/checkout@master
      
      - name: Use Node.js ${{ matrix.node-version }}
        uses: actions/setup-node@master
        with:
          node-version: ${{ matrix.node-version }}
          
      - name: Install
        run: yarn install
        env:
          CI: true
          
      - name: Test
        run: yarn test

  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Build and deploy
        uses: JamesIves/github-pages-deploy-action@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          BRANCH: gh-pages
          FOLDER: build
          BUILD_SCRIPT: yarn install && yarn build
```


Notes:

- This could can be setup to only run the deploy after tests pass.
- This could also be adjusted test can run on any branch, but _deploy_ only on master pushes.
