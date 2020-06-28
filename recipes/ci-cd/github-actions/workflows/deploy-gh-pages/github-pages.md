# Github Pages action

Action:

- [Github Pages action](https://github.com/marketplace/actions/github-pages-action) - `peaceiris/actions-gh-pages`

This works with static site generators like Hugo, MkDocs, Gatsby, GitBook and mdBook. It has many stars.


## Usage

This supports all 3 token types but `GITHUB_TOKEN` works great.

### Basic

Deploy to `gh-pages` branch by default. Add this as a step in your workflow.

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
