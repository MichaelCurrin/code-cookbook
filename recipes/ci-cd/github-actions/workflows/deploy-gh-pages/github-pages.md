# Github Pages action

This is a popular action I found.

- [Github Pages action](https://github.com/marketplace/actions/github-pages-action) - `peaceiris/actions-gh-pages@`

Works with static site generators like Hugo, MkDocs, Gatsby, GitBook and mdBook.


## Usage

This supports all 3 token types but `GITHUB_TOKEN` works great.


```yaml
- name: Deploy
  uses: peaceiris/actions-gh-pages@v3
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    publish_dir: ./public
```

Optionally set branch to deploy to, if not `gh-pages`.

```yaml
    publish_branch: master
```
