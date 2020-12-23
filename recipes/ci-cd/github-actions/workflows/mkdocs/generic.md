---
description: Build and deploy MkDocs to GH Pages using generic actions
---
# Generic


## Sample

See [docs.yml](https://github.com/MichaelCurrin/mkdocs-quickstart/blob/master/.github/workflows/docs.yml) in my quickstart project.

That installs Python and dependencies as with any Python project. T

Then it runs a MkDocs CLI command to deploy. This avoids having to use special action around GH Pages or MkDocs.


### Details on the deploy command

You can add this command to deploy a build and deploy in one step. Optionally use `--force` flag for force push.

```sh
$ mkdocs gh-deploy --strict
```

That works locally and on GH Pages.
