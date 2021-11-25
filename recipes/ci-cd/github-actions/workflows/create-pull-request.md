# Create Pull Request

## Related 

- [Commit][] workflows so you create a commit without a Pull Request, such as if you want to commit on the main branch.

[Commit]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/commit.md %}


{% raw %}

## Create Pull Request action

- [Create Pull Request](https://github.com/marketplace/actions/create-pull-request) action
   > A GitHub action to create a pull request for changes to your repository in the actions workspace.

If you use this action, you don't need a separate step to commit first, as this handles it for you.

> The changes will be automatically committed to a new branch and a pull request created.

Usage:

```yaml
steps:
  - name: Create Pull Request
    uses: peter-evans/create-pull-request@v3
```

All inputs are optional but you probably want to set some of these:

- `title` for PR title.
- `branch` for branch name to create. 
- `delete-branch` - Delete the branch when closing pull requests, and when undeleted after merging. Recommended as `true`. I don't know how this compares to the settings of the repo. This optional might not be useful.	

The docs recommend using a fix branch name, rather than one that is unique, to avoid to many branches/PRs.

With options:

```yaml
steps:
  - name: Create Pull Request
    uses: peter-evans/create-pull-request@v3
    with: 
      title: My PR title
      commit-message: My commit message
      branch: my-branch-name
      delete-branch: true
```


## No action

Here we hit the GitHub API to create a PR. 

We don't actually make the commit or branch here - just the PR itself. See [Commit][] recipe for making the commit.

[Commit]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/commit.md %}

### Same repo

Note that `GITHUB_TOKEN` will be generated for you.

```yaml
env:
  BRANCH_NAME: ${{ github.head_ref }}

jobs:
  create-pr:
    steps:
      - name: Create Pull Request
        run: |
          PAYLOAD=$(cat <<EOF
            {
              "title": "Title of my PR",
              "body": "Automated PR to ...",
              "head": "${BRANCH_NAME}",
              "base": "main"
            }
          EOF
          )
          curl https://api.github.com/repos/my-user/other-repo/pulls \
            --header "Authorization: token ${ TOKEN }" \
            -H "Content-Type:application/json" \
            -d "$PAYLOAD"
        env:
          TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Across repos

Note that here we are targeting a different repo to the current repo, so need a token to be specified as `GH_TOKEN` in secrets (don't use the built-in `GITHUB_TOKEN` name.

```yaml
env:
  BRANCH_NAME: ${{ github.head_ref }}

jobs:
  create-pr:
    steps:
      - name: Create Pull Request
        run: |
          PAYLOAD=$(cat <<EOF
            {
              "title": "Title of my PR",
              "body": "Automated PR to ...",
              "head": "${BRANCH_NAME}",
              "base": "main"
            }
          EOF
          )
          curl 
            https://api.github.com/repos/my-user/my-repo/pulls \
            --header "Authorization: token ${TOKEN}" \
            -H "Content-Type:application/json" \
            -d "$PAYLOAD"
        env:
          TOKEN: ${{ secrets.GH_TOKEN }}
```

You can also do this:

```
-u my-user:$GITHUB_TOKEN
```


{% endraw %}
