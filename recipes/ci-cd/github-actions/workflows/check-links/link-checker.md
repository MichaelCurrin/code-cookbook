# Link Checker action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Link%20Checker-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=github)](https://github.com/marketplace/actions/link-checker)

A GitHub action for link checking repository Markdown and HTML files.

_Note: I am not going to use this since the default gives an error as nothing on `*` and the expected subdirectory is not recognized. Perhaps this only works on a built site as that is an example where I saw this used._


## Usage

### Basic

Step:

```yaml
steps:
- name: Link Checker
  uses: peter-evans/link-checker@v1
```

### Custom args

Optionally pass arguments to [Liche](https://github.com/raviqqe/liche). Defaults shown here.

Step:

```yaml
steps:
- name: Link Checker
  uses: peter-evans/link-checker@v1
  with:
    args: -v -r *
```

Note that even on verbose mode, nothing is outputted on a success so you can't see that any URLs were checked.

 
### Create issues on error
 
When used in conjunction with [Create Issue From File](https://github.com/peter-evans/create-issue-from-file), issues will be created when Link Checker finds connectivity problems with links.

Based on the example from the Check Links docs.
 
 ```yaml
name: Check markdown links
 
 on:
  schedule:
  - cron: '0 0 1 * *'

jobs:
  link-checker:
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

### Run checks against output directory

This checks links the directory like `site`.

This runs against HTML files but it will still work.

[source](https://github.com/fluxcd/flux/blob/master/.github/workflows/docs.yaml)

```yaml
steps:
# Use liche action to check generated HTML site
- name: Link Checker (generated site)
  id: lc
  uses: peter-evans/link-checker@v1
  with:
    args: -d site -r site -x man7.org
    
- name: Fail on link errors
  run: exit ${{ steps.lc.outputs.exit_code }
```
