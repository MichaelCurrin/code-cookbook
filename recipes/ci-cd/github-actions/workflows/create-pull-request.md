# Create Pull Request

{% raw %}


## Create Pull Request action

- [Create Pull Request](https://github.com/marketplace/actions/create-pull-request) action


Usage:

```yaml
steps:
  - name: Create Pull Request
    uses: peter-evans/create-pull-request@v3
```

All inputs are optional but you probably want to set some of these:

- `title` for PR title.
- `branch` for branch name.
- `delete-branch` - Delete the branch when closing pull requests, and when undeleted after merging. Recommend `true`.	




## No action and across repos

Hit the GitHub API to create a PR. 

Note that here we are targeting a different repo to the current repo, so need a token to be specified.

```yaml
env:
  BRANCH_NAME: ${{ github.head_ref }}
  GITHUB_TOKEN: ${{ secrets.TOKEN }}

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
          curl -v -u my-user:$GITHUB_TOKEN \
            -H "Content-Type:application/json" \
            https://api.github.com/repos/my-user/other-repo/pulls \
            -d "$PAYLOAD"
```


{% endraw %}
