# Deploy MkDocs action

- [deploy-mkdocs](https://github.com/marketplace/actions/deploy-mkdocs) action.

That action will install MkDocs and the Material theme and deploy to GH Pages for you. 

See the shell steps in [action.sh](https://github.com/mhausenblas/mkdocs-deploy-gh-pages/blob/master/action.sh) script.

The author made a template repo - [mhausenblas/mkdocs-template](https://github.com/mhausenblas/mkdocs-template).


## Usage

Example based on the one in the action's docs:

- `main.yml`
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

The trigger section can be stricted to `docs` only. A good reason to move `requirements.txt` to the `docs` directory.

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
