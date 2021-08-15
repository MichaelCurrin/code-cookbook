---
logo: yarn
description: Workflows for running Yarn on GitHub Actions
---
# Yarn

{% raw %}

GH Actions already setups Node and Yarn for you. You might get an old version of Node and Yarn though.

This section covers how to set up one or more target versions of Node and Yarn and handle caching of NPM packages.


## Homepage set up

If you use GitHub Pages for your site hosting, you should set this up before using any CI flows. That way, your site will be served on the correct subpath, as React infers it.

- `package.json`
    ```json
    {
     "scripts": {
      },
      "homepage" : "https://MichaelCurrin.github.io/my-app/"
    }
    ```

See [package.json][] in my React Quickstart to see it configured for [michaelcurrin.github.io/react-quickstart/](https://michaelcurrin.github.io/react-quickstart/).



## Samples

### Simple

The GH docs recommend installing with Yarn using [Set up Node][] action.

```yaml
steps:
- name: Use Node.js ⚙️
  uses: actions/setup-node@v2
  with:
    node-version: '14'
    
- name: Install dependencies 📦
  run: yarn install --frozen-lockfile
```

This won't handle any caching of dependencies though.

The Node version number is optional. See later sections on this page for a matrix of Node versions.

The `--frozen-lockfile` flag is to prevent changes to the lockfile. Presumably this only makes a difference if you added a package to `package.json` without updating your lockfile locally, which means a CI install will install packages and change the lockfile each time, without saving it. Or maybe some transitive dependencies are allowed to upgrade on a fresh install, but not when using the lockf flag.

Note that NPM doesn't have the flag and it NPM installs gets by fine in CI.

### Caching

Load cached dependencies.

See the Yarn section of the [Cache][] guide.


### GH Actions sample

This uses the [GitHub Action for Yarn][] action - `borales/actions-yarn`.

This action doesn't just set up Yarn, it actually runs the commands that you pass to it (except you say have to use `install` instead of `yarn install`).

For basic use of this action (like Node/Yarn test and no caching), it is an unnecessary dependency and I don't see the benefit. So just use the [Simple][] flow above or the [Basic][] page.

- `main.yml`
    ```yaml
    name: CI

    on: push

    jobs:
      build:
        name: Build and test
        
        runs-on: ubuntu-latest

        steps:
          - name: Checkout
            uses: actions/checkout@master

          - uses: borales/actions-yarn@v2.0.0
            with:
              cmd: install

          - uses: borales/actions-yarn@v2.0.0
            with:
              cmd: build

          - uses: borales/actions-yarn@v2.0.0
            with:
              cmd: test
    ```

### React Yarn cache

From this [GitHub Actions React Node post][] about deploying React/Node to Heroku.

This uses:

- `actions/checkout`
- `actions/cache` - for a faster build
- `actions/setup-node`

Workflow:

- main.yml
    ```yaml
    jobs:
      test:
        name: Test
        runs-on: ubuntu-latest
        env:
          NODE_ENV: test

        steps:
          - name: Checkout
              uses: actions/checkout@master

            - name: Get yarn cache
              id: yarn-cache
              run: echo "::set-output name=dir::$(yarn cache dir)"

            - uses: actions/cache@v1
              with:
                path: ${{ steps.yarn-cache.outputs.dir }}
                key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
                restore-keys: |
                  ${{ runner.os }}-yarn-

            - name: Set up Node
              uses: actions/setup-node@v1.1.0
              with:
                node-version: '10.x'

            - name: Install dependencies
              run: yarn install --frozen-lockfile

            - name: Lint
              run: yarn lint

            - name: Migrate
              run: knex migrate:latest

            - name: Test server
              run: yarn test:server

      deploy:
        name: Deploy
        runs-on: ubuntu-latest
        needs: test
    ```


## React Yarn

From [react-build-with-github-actions][] example app - just the install/test portion.

- `main.yml`
    ```yaml
    jobs:
      install-and-test:
        runs-on: ubuntu-latest

        strategy:
          matrix:
            node-version: [8.x, 10.x, 12.x]

        steps:
          - uses: actions/checkout@master

          - name: Set up Node.js ${{ matrix.node-version }}
            uses: actions/setup-node@master
            with:
              node-version: ${{ matrix.node-version }}

          - name: Install packages
            run: yarn install --frozen-lockfile
         
          - name: Test
            run: yarn test
            
            env:
              CI: true
    ```

I don't know what `CI` does here.

I prefer having install and test steps separately.


## GH Pags NPM packagse

Here we use the [gh-pages][] package NPM to deploy to GitHub Pages.

Set up commands and URL:

- `package.json`:
    ```json
    {
     "scripts": {
       "build": "..."
       "predeploy": "yarn build",
       "deploy": "gh-pages -d build"
      },

      "homepage" : "https://MichaelCurrin.github.io/my-app"
    }
    ```
   
Note `predeploy` it set up such that a build is always done before publishing.

Add dev dependency:

```sh
$ yarn add --dev gh-pages
```

Now at the end of the GH Actions CI, add a step:

```

- name: Install packages
  run: yarn install --frozen-lockfile

- name: Deploy GitHub Pages 🚀
  run: yarn deploy
  env:
    GH_TOKEN: ${{ secretes.GITHUB_TOKEN }}
```

You don't need to generated and store the token manually. GitHub Actions will generate it for you on each run and no human has to read the value, keeping it secure.

That flow is based on output generated by `yarn` when doing a build that uses GitHub Pages in `PUBLIC_URL`.

```
The project was built assuming it is hosted at /react-create-app-quickstart/.
You can control this with the homepage field in your package.json.

The build folder is ready to be deployed.
To publish it at https://michaelcurrin.github.io/react-create-app-quickstart/ , run:

  yarn add --dev gh-pages

Add the following script in your package.json.

    // ...
    "scripts": {
      // ...
      "predeploy": "yarn build",
      "deploy": "gh-pages -d build"
    }

Then run:

  yarn run deploy

Find out more about deployment here:

  bit.ly/CRA-deploy
```

{% endraw %}

[gh-pages]: https://www.npmjs.com/package/gh-pages
[react-build-with-github-actions]: https://github.com/explooosion/react-build-with-github-actions
[package.json]: https://github.com/MichaelCurrin/react-quickstart/blob/main/package.json
[GitHub Action for Yarn]: https://github.com/marketplace/actions/github-action-for-yarn
[GitHub Actions React Node post]: https://spin.atomicobject.com/2020/01/20/github-actions-react-node/
[Set up Node]: https://github.com/actions/setup-node

[Cache]: {{ site.baseurl }}{% link code-cookbook/ci-cd/github-actions/workflows/cache.md %}
[Basic]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/node/basic.md %}
