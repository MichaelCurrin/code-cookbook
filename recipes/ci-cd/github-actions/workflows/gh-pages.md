# Github Pages deploy
> How to use an action to build and deploy a site to Github Pages

This skips the standard GH Pages build so you don't have to use Jekyll.

See [Tokens](/recipes/ci-cd/github-actions/tokens/) guide on use of tokens.


## Using Github Pages Action

This is a popular action I found.

- [Github Pages action](https://github.com/marketplace/actions/github-pages-action) - `peaceiris/actions-gh-pages@`

Works with static site generators like Hugo, MkDocs, Gatsby, GitBook and mdBook.

Sample:

```yaml
- name: Deploy
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./public
```

This supports all 3 token types.


## Using the Github Pages Deploy Action

### Sample

Here we deploy a project using NPM command. Such as React or Vue or Gatsby.

- [Github Pages Deploy Action](https://github.com/marketplace/actions/deploy-to-github-pages)
- `JamesIves/github-pages-deploy-action`

This is based on that action's sample.

Uses:

- `actions/checkout`
- `JamesIves/github-pages-deploy-action`
- `npm`

Note that `actions/setup-node` is not used.

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
        run: |
          npm install

      - name: Build 🏗️
        run: |
          npm run build

      - name: Deploy 🚀
        uses: JamesIves/github-pages-deploy-action@releases/v3
        with:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          BRANCH: gh-pages
```

Notes:

- Some emojis to use: `⚙️ 🧱`
- If you're using actions/checkout@v2 you must set persist-credentials to false in most cases for the deployment to work correctly.
- The branch is _required_.
- Tests are missing. See example below.


### Two-job example

Install, test and deploy.

Here we use Yarn and several versions of Node test the app and then one version of Node to deploy the React app.

From [explooosion/react-build-with-github-actions](https://github.com/explooosion/react-build-with-github-actions).

Uses:

- `actions/checkout`
- `actions/setup-node` (tests only)
- `JamesIves/github-pages-deploy-action`
- `yarn`

Perhaps this can be setup to only run the deploy after tests pass.

Perhaps test can run on any branch but deploy only on master.

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
      - name: Install and Test
        run: |
          yarn
          yarn test
        env:
          CI: true

  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Build and Deploy
        uses: JamesIves/github-pages-deploy-action@master
        env:
          ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
          BRANCH: gh-pages
          FOLDER: build
          BUILD_SCRIPT: yarn && yarn build
```
