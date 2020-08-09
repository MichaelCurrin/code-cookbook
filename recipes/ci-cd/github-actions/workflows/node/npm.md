# NPM actions

See GH docs - [Using Node.js with GitHub Actions](https://docs.github.com/en/actions/language-and-framework-guides/using-nodejs-with-github-actions).

Note use of this which comes from the doc linked above, but it is not used consistently in the docs - need to research what it does to test.

```yaml
- run: npm test
  env:
    CI: true
```

For persist artificts, see [Persisting workflow data using artifacts](https://docs.github.com/en/actions/configuring-and-managing-workflows/persisting-workflow-data-using-artifacts) - not covered here.


## Samples

### Basic

Use single Node.js version

I created this based on the other samples.

```yaml
steps:
- uses: actions/checkout@v2

- name: Use Node.js  
  uses: actions/setup-node@v1
  with:
    node-version: '14.x'

- run: npm ci
- run: npm run build --if-present
- run: npm test
  env:
    CI: true
```

### Cache dependencies

This reduces build time as dependencies are cached between builds.

Sample from the docs.

```yaml
steps:
- uses: actions/checkout@v2

- name: Use Node.js
  uses: actions/setup-node@v1
  with:
    node-version: '12.x'
    
- name: Cache Node.js modules
  uses: actions/cache@v2
  with:
    # npm cache files are stored in `~/.npm` on Linux/macOS
    path: ~/.npm 
    key: ${{ runner.OS }}-node-${{ hashFiles('**/package-lock.json') }}
    restore-keys: |
      ${{ runner.OS }}-node-
      ${{ runner.OS }}-
      
- name: Install dependencies
  run: npm ci
```

### Matrix

This sample comes from the docs and is similar to the default covered in the example after this.

```yaml
name: Node.js CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [8.x, 10.x, 12.x]

    steps:
    - uses: actions/checkout@v2
    
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
        
    - run: npm install
    - run: npm run build --if-present
    - run: npm test
      env:
        CI: true
```


### Setup Node action default

From the Github Action samples:

- [Setup Node action](https://github.com/marketplace/actions/setup-node-js-environment) - `actions/setup-node`

```yaml
# This workflow will do a clean install of node dependencies, build the source code and run tests across different versions of node
# For more information see: https://help.github.com/actions/language-and-framework-guides/using-nodejs-with-github-actions

name: Node.js CI

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        node-version: [10.x, 12.x]

    steps:
    - uses: actions/checkout@v2
    
    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v1
      with:
        node-version: ${{ matrix.node-version }}
        
    - run: npm ci
    - run: npm run build --if-present
    - run: npm test
```
