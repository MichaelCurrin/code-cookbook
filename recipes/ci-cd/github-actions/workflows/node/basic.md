# Basic

A simple flow to build a Node app with GitHub Actions.

This works using `actions/checkout`. Note that **no** specific Node or Yarn action is used here - the default environment will have that setup for you already.

```yaml
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@master
        with:
          persist-credentials: false

      - name: Install 🔧
        run: npm install

      - name: Build 🏗️
        run: npm run build
```

If you have any linting or unit tests, add them too.

## NPM vs Yarn

We used `npm` here but this can work with `yarn` too.
