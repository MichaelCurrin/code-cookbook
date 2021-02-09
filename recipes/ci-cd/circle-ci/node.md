# Node

## Samples

### CircleCI default

Based on CircleCI's generated file.

```yaml
version: 2.1

orbs:
  node: circleci/node@3.0.0
  
workflows:
  node-tests:
    jobs:
      - node/test
```

### Getting started

From Getting Started page in the docs.

```yaml
version: 2.1

orbs:
  node: circleci/node@1.1
  
jobs:
  build:
    executor:
      name: node/default
      tag: '10.4'
      
    steps:
      - checkout
      - node/with-cache:
          steps:
            - run: npm install
      - run: npm run test
```
