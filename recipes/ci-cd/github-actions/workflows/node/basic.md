# Basic

A simple CI flow to check and build a Node app using GitHub Actions.

## Local commmands

Here are the commands we run locally:

```sh
$ npm install
$ npm run lint
$ npm run build 
$ npm test
```

You can course leave out a step if it is not needed but here I assume they are all needed and in this order.

## Workflow

Here is a workflow to setup on GH Actions.

Add to your repo as `.github/workflows/main.yml`.

```yaml
name: Node CI

on: push

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout 🛎️
        uses: actions/checkout@master
        with:
          persist-credentials: false

      - name: Install 🔧
        run: npm install

      - name: Run linter 🧐
        run: npm run lint

      - name: Build 🏗️
        run: npm run build

      - name: Run unit tests ☑
        run: npm test
```


## Actions used

This workflow uses `actions/checkout`, a standard action. 

Note that **no** specific Node or Yarn action was used here - the default environment will have those setup for you already.

We used `npm` here but commands using `yarn` will be fine too.
