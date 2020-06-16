# Github Pages action

This is a popular action I found.

- [Github Pages action](https://github.com/marketplace/actions/github-pages-action) - `peaceiris/actions-gh-pages@`

Works with static site generators like Hugo, MkDocs, Gatsby, GitBook and mdBook.


## Usage

This supports all 3 token types but `GITHUB_TOKEN` works great.

### Basic

Deploy to `gh-pages`.

```yaml
- name: Deploy
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./public
```

### Publish to `master`

```yaml
    publish_branch: master
```

### Publish to alternate repo

```yaml
- name: Deploy
  uses: peaceiris/actions-gh-pages@v3
  with:
    deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
    external_repository: username/external-repository
    publish_branch: master
    publish_dir: ./public
```
