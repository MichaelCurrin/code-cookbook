# Basic

This works using `actions/checkout` and **no** specific Node or Yarn action is used.

We use `npm` here but this works with `yarn` too.

```yaml
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
```
