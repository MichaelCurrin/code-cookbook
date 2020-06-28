# Basic

A simple flow to build a Node app with Github Actions.

This works using `actions/checkout`. Note that **no** specific Node or Yarn action is used.

```yaml
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout
        with:
          persist-credentials: false

      - name: Install 🔧
        run: npm install

      - name: Build 🏗️
        run: npm run build
```

We use `npm` here but this can work with `yarn` too.
