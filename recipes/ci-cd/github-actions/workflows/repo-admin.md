# Repo admin

Sample workflow files for `.github/workflows/` to automate repo administration tasks.

Note - you might have install an app in your account or repo to give it permissions.


## Labeler

`labeler.yml`

```yaml
name: "Pull Request Labeler"
on:
- pull_request

jobs:
  triage:
    runs-on: ubuntu-latest

    steps:
    - uses: Foo/labeler@glob-all
      with:
        repo-token: "${{ secrets.GITHUB_TOKEN }}"
```


## Stale

`stale.yml`

```yaml
# Configuration for https://github.com/actions/stale

name: "Stale issues and pull requests"
on:
  schedule:
  - cron: "0 5 * * *"

jobs:
  stale:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/stale@v1
      with:
        repo-token: ${{ secrets.GITHUB_TOKEN }}
        stale-issue-message: >-
          Thanks for your contribution!
          This issue has been automatically marked as stale because it has not had
          activity in the last 30 days. Note that the issue will not be automatically
          closed, but this notification will remind us to investigate why there's
          been inactivity. Thank you for participating in the Foo open source community.
          If you would like this issue to remain open:
            1. Verify that you can still reproduce the issue in the latest version of this project.
            1. Comment that the issue is still reproducible and include updated details requested in the issue template.
        days-before-stale: 30
        days-before-close: 99999
        stale-issue-label: 'stale'
        exempt-issue-label: 'stale/exempt'
        stale-pr-message: >-
          This issue has been automatically marked as stale because it has not had activity in the last 30 days.
          Note that the issue will not be automatically closed, but this notification will remind us to investigate why there's been inactivity.
        stale-pr-label: 'stale'
        exempt-pr-label: 'stale/exempt'
```
