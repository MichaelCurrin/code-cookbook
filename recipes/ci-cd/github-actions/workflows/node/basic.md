# Basic
> Simple Node.js workflow with GH Actions

A simple CI flow to check and build a Node app using GitHub Actions.


## Commmands

Here are the typical commands to run for a Node app. These should be run locally first and then added to a deploy pipeline so it can be run on every push.

```sh
$ npm install
$ npm run lint
$ npm run build 
$ npm test
```

You can course leave out a step if it does not make sense for your app, but here I assume they are all needed and in this order.


## Workflow sample

Here is a workflow to setup on GH Actions.

Add to your repo. Use any file name but the directory is important.

- `.github/workflows/main.yml`
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

The `npm` command was used here, but `yarn` will be fine too.


## Actions used
> Which actions are used in the workflow above

This workflow uses `actions/checkout`, a standard action for cloning the repo in a workflow run.


Note that **no** Node or Yarn action was used here - the default environment will setup Node.js and Yarn for you. Using an extension is useful if you want to lock down a certain Node.js version or run multiple versions in parallel example. See the [node](node.md) sample's matrix area for more info.

