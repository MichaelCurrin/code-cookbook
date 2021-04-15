---
description: A generic action which builds a GH Pages and works great with Jekyll and React/Vue JS apps
---
# GitHub Pages action by Peace Iris

{% raw %}

Action:

- [Github Pages action](https://github.com/marketplace/actions/github-pages-action) - `peaceiris/actions-gh-pages`

This action will publish a target build directory as a `gh-pages` branch with a commit and it will serve it on GH Pages.

This does not actually build the directory itself, leaving that up to you with your own steps.

This action integrates well with any flow that writes a build directory. Including static site generators such as Jekyll, Hugo, MkDocs, Gatsby, GitBook and mdBook, or web apps such as a React and Vue which have a `npm run build` step.

This action also has many stars so that adds to my confidence in its quality and long term maintenance.


## Usage

This action supports all 3 token types for getting permissions to commit to your branch.

I highly recommend `GITHUB_TOKEN` as set below. It requires zero set up and is the most secure (no human can see the token value not even you, and unlike the personal access token the GitHub token only has access to _one repo_ and not all of them).

You do not need to modify your Secrets. You can copy and paste the code below exactly as it is, then GH Actions will create and substitute a secret token for you in each run.

### Basic

Deploy to the `gh-pages` branch (by default).

Add this as a step in your workflow and set the last parameter to your build directory e.g. `_site` for Jekyll or `build` for a Node app.

```yaml
steps:
  - name: Deploy 🚀
    uses: peaceiris/actions-gh-pages@v3

    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      publish_dir: public
```

### Don't clean

Prevent the old files in the `gh-pages` from being deleted. This is useful if you have hash filenames for assets and want to keep the assets for old deploys available. This avoids getting 404 error on loading JS for example, where the browser has the old HTML page cached. That error causes a blank page on a Vue app after a deploy.

```yaml
keep_files: true
```

### Publish to a custom branch

Choose a different branch.

```yaml
publish_branch: master
```

### Publish to an alternative repo

Choose a repo for `external_repository`. Note use of `deploy_key` from that target repo, as `github_token` will probably not work.

```yaml
- name: Deploy 🚀
  uses: peaceiris/actions-gh-pages@v3

  with:
    deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
    external_repository: username/external-repository
    publish_branch: master
    publish_dir: public
```

{% endraw %}
