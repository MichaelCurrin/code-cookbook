# GitHub Pages action
> How to build GH Pages from master, for Jekyll and other site generators

Action:

- [Github Pages action](https://github.com/marketplace/actions/github-pages-action) - `peaceiris/actions-gh-pages`

This action will publish a target build directory as a `gh-pages` branch with a commit and it will serve it on GH Pages.

This does not actually build the directory itself, leaving that up to you with your own steps.
This action integrates well with any flow that writes a build directory. Including static site generators such as Jekyll, Hugo, MkDocs, Gatsby, GitBook and mdBook, or web apps such as a React and Vue which have a `npm run build` step.

This action also has many stars so that adds to my confidence in its quality and long term maintenance.


## Usage

This supports all 3 token types, but `GITHUB_TOKEN` is the simplest and works perfectly so I prefer that. You do not need to modify the token field below - you can copy and paste as is and GH Actions will substitute your secret token in for you.

### Basic

Deploy to `gh-pages` branch (by default). 

Add this as a step in your workflow and set the last parameter to your build directly e.g. `_site` or `build`.

```yaml
- name: Deploy 🚀
  uses: peaceiris/actions-gh-pages@v3

  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./public
```

### Publish to custom branch

Choose a different branch.

```yaml
    publish_branch: master
```

### Publish to alternative repo

Choose a repo for `external_repository`. Note use of `deploy_key` from that target repo, as `github_token` will probably not work.

```yaml
- name: Deploy 🚀
  uses: peaceiris/actions-gh-pages@v3

  with:
    deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
    external_repository: username/external-repository
    publish_branch: master
    publish_dir: ./public
```
