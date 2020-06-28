# Yarn

## Example 1

From Github Actions samples.

Uses the [Github Action for Yarn](https://github.com/marketplace/actions/github-action-for-yarn) action - `borales/actions-yarn`.

This passes commands to run with `yarn`.

Note that this doesn't give much benefit over the [basic](basic.md) flow unless you use more details like in the second example below.

```yaml
name: CI

on: [push]

jobs:
  build:
    name: Test
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@master
      
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

## Example 2

From this [post](https://spin.atomicobject.com/2020/01/20/github-actions-react-node/) about deploying React/Node to Heroku.

This uses:

- `actions/checkout`
- `actions/cache` - for a faster build
- `actions/setup-node`

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

    - uses: actions/setup-node@v1.1.0
      with:
        node-version: '10.x'

    - run: yarn install

    - run: yarn lint
    - run: knex migrate:latest
    - run: yarn test:server

  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    needs: test
```


## Example 3

From [react-build-with-github-actions](https://github.com/explooosion/react-build-with-github-actions) example app - just the install/test portion.

```yaml
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
          yarn instll
          yarn test
        env:
          CI: true
```


## Tips

Generate by `yarn` when doing a build that uses Github Pages in `PUBLIC_URL`.

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


An example of homepage value set in `package.json`:

```json
{
  "homepage" : "http://myname.github.io/myapp"
}
```
