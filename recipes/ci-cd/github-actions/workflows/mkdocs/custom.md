# Custom

How to piece together general-purpose actions to handle a deploy of MkDocs to GH Pages.


## Build, check links, deploy

Based on another project I found.

This won't persist the docs.

- `main.yml`
    ```yaml
    name: Check docs

    on:
      pull_request:
      push:
        branches:
          - master

    jobs:
      link-checker:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v2
          - name: Set up Python 3.x
            uses: actions/setup-python@v2

          - name: Install dependencies
            run: |
              python -m pip install --upgrade pip
              pip install -r docs/requirements.txt

          - name: Build docs
            run: mkdocs build

          - name: Link Checker
            id: lc
            uses: peter-evans/link-checker@v1
            with:
              args: -d ./site -r ./site -x man7.org

          - name: Fail on errors
            run: exit ${{ steps.lc.outputs.exit_code }}
    ```

Need to research Liche to see appropriate replacement args for the above.

Also `mkdocs build --strict` is probably a good idea.

You'll only want to run that on a `master` build while the link checks above are setup to work on a PR too.


## Publish


You can add this command to deploy a build and deploy in one step. Optionally use `--force` flag for force push.

```sh
$ mkdocs gh-deploy --strict
```

That can be run locally or in CI flow.

Or use a more generic to [Deploy GitHub Pages](../deploy-gh-pages/) folder from site directory. As with any static output.
