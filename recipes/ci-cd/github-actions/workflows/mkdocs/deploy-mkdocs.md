# Deploy MkDocs action

- [deploy-mkdocs](https://github.com/marketplace/actions/deploy-mkdocs)

This will build and publish docs via GitHub Pages.

Note that `requirements.txt` is not specified in the example - still need to check how this handles `mkdocs` version and themes.

I use that action here:

- [MichaelCurrin/mkdocs-quickstart](https://github.com/MichaelCurrin/mkdocs-quickstart)


## Usage

Example based on the one in the action docs:


```yaml
name: Deploy docs

on:
  push:
    branches:
      - master

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout master
        uses: actions/checkout@v1

      - name: Deploy to GH Pages
        uses: mhausenblas/mkdocs-deploy-gh-pages@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

The trigger section can be stricted to `docs` only. A good reason to move `requirments.txt` to the `docs` directory.

```yaml
on:
  push:
    branches:
      - master
    paths: 
      - 'docs/**'
```

The `env` section also allows:

```yaml
CUSTOM_DOMAIN: optionaldomain.com
```
