---
description: Build and deploy MkDocs to GH Pages using generic actions
---
# Generic



## The MkDocs GH deploy command

That works locally and on GH Pages.

You can add this command to deploy a build and deploy it - all in one step. Optionally, use `--force` flag for force push.

```sh
$ mkdocs gh-deploy --strict
```

This will be used in samples below.


## Samples

Flow:

1. The workflows installs Python and dependencies, as with any Python project.
1. Then it runs a MkDocs CLI command to deploy, which you could run locally or remotely. This avoids having to use special action around GH Pages or MkDocs - as MkDocs itself knows how to deploy to GitHub Pages.

### Basic

- `docs.yml`
    ```yaml
    jobs:
      build-deploy:
        name: Build and deploy docs

        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@v2

          - name: Set up Python 3 ⚙️ 🐍
            uses: actions/setup-python@v2

          - name: Install dependencies 🔧
            working-directory: docs
            run: pip install -r requirements.txt

          - name: Build and deploy to GitHub Pages 🏗️ 🚀
            working-directory: docs
            run: mkdocs gh-deploy --strict
    ```

### Cache and Makefile

See this for a live example using `Makefile` and dependency caching.

- [docs.yml](https://github.com/MichaelCurrin/mkdocs-quickstart/blob/master/.github/workflows/docs.yml) in my `mkdocs-quickstart` project
