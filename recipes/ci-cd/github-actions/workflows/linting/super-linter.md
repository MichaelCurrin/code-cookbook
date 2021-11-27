# Super linter

Marketplace - [super-linter](https://github.com/marketplace/actions/super-linter?version=v2.0.0).

Lint multiple languages at once without configuring or installing- just add a GitHub Action and push.

See the Wiki on the repo and the [Disable linters](https://github.com/github/super-linter/blob/master/docs/disabling-linters.md) page in the docs.


## Usage

Just add `github/super-linter` as a step. Without parameters.

Full example:

```yaml
name: Lint

on:
  push:

jobs:
  build:
    name: Lint

    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@master

      - name: Lint
        uses: docker://github/super-linter:v3
```

Set variables optionally:

```yaml
        env:
          VALIDATE_ALL_CODEBASE: false
          VALIDATE_ANSIBLE: false
```

The docs strongly recommend running using the pre-built image as `docker://github/super-linter:v3`. Or compile your own at a cost, with `github/super-linter@v3`.
