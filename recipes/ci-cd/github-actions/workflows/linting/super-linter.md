# Super linter


Lint multiple languages at once without configuring or installing- just add a Github Action and push.

## Sample


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
        uses: github/super-linter@v2.0.0
```

Set variables optionally:

```yaml
        env:
          VALIDATE_ALL_CODEBASE: false
          VALIDATE_ANSIBLE: false
```
