# Deploy MkDocs action

[deploy-mkdocs](https://github.com/marketplace/actions/deploy-mkdocs)

## Usage

Example from the action:

```yaml
name: Publish docs via GitHub Pages
on:
  push:
    branches:
      - master

jobs:
  build:
    name: Deploy docs
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout master
        uses: actions/checkout@v1

      - name: Deploy docs
        uses: mhausenblas/mkdocs-deploy-gh-pages@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

The `env` section also allows:

```yaml
CUSTOM_DOMAIN: optionaldomain.com
```
