---
description: Build and deploy MkDocs to GH Pages using generic actions
---
# Generic


## Sample

- [docs.yml](https://github.com/MichaelCurrin/mkdocs-quickstart/blob/master/.github/workflows/docs.yml) in my `mkdocs-quickstart` project.

That installs Python and dependencies, as with any Python project.

Then it runs a MkDocs CLI command to deploy, which you could can run locally or remotely. This avoids having to use special action around GH Pages or MkDocs - as MkDocs itself knows how to deploy to GitHub Pages.


### Details on the deploy command

You can add this command to deploy a build and deploy in one step. Optionally use `--force` flag for force push.

```sh
$ mkdocs gh-deploy --strict
```

That works locally and on GH Pages.
