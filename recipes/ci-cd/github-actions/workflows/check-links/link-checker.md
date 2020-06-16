# Link Checker action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Link%20Checker-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=github)](https://github.com/marketplace/actions/link-checker)

A GitHub action for link checking repository Markdown and HTML files.

When used in conjunction with [Create Issue From File](https://github.com/peter-evans/create-issue-from-file), issues will be created when Link Checker finds connectivity problems with links.


## Usage

### Basic

Step:

```yaml
- name: Link Checker
  uses: peter-evans/link-checker@v1
```

### Custom args

Optionally pass arguments to [Liche](https://github.com/raviqqe/liche). Defaults shown here.

Step:

```yaml
- name: Link Checker
  uses: peter-evans/link-checker@v1
  with:
    args: -v -r *
 ```
 
 ### Schedule and create issues
 
 ```yaml
 on:
  schedule:
  - cron: '0 0 1 * *'
  
name: Check markdown links
jobs:
  linkChecker:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Link Checker
        uses: peter-evans/link-checker@v1
        
      - name: Create Issue From File
        uses: peter-evans/create-issue-from-file@v2
        with:
          title: Link Checker Report
          content-filepath: ./link-checker/out.md
          labels: report, automated issue
```

### Fail on error

Add a step at the end.

```yaml
- name: Fail if there were link errors
  run: exit ${{ steps.lc.outputs.exit_code }}
```

### Real world example

[source](https://github.com/fluxcd/flux/blob/master/.github/workflows/docs.yaml)

```yaml
# Use liche action to check generated HTML site
- name: Link Checker (generated site)
  id: lc
  uses: peter-evans/link-checker@v1
  with:
    args: -d ./site -r ./site -x man7.org
    
- name: Fail if there were link errors
  run: exit ${{ steps.lc.outputs.exit_code }}
```
