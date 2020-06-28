# Generic Github Actions cheatsheet


## Basic

Here we use a standard [Checkout](https://github.com/actions/checkout) action and some install and build steps without installing any extra Actions. These steps can be replaced with other shell commands.

```yaml
name: Build

on: [push]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@master

      - name: Install 🔧
        run: npm install

      - name: Build 🏗️
        run: npm run build
```

Alternatively specify a version e.g. `actions/checkout@v2`.


## Clear credentials

If you do anything with secret data such as tokens, it recommended to add this paramter:

```yaml
      - name: Checkout 🛎️
        uses: actions/checkout@master
        with:
          persist-credentials: false
```


## Submodules

If you have a submodules to checkout, add this for the relevant step:

```yaml
      - name: Checkout 🛎️
        uses: actions/checkout@master
        with:
          submodules: true
```
