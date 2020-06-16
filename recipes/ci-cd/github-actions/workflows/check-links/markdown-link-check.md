# Markdown Link Check action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Markdown_Link_Check-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=github)](https://github.com/marketplace/actions/markdown-link-check)

## Usage

### Basic

```yaml
name: Check Markdown links

on: push

jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: gaurav-nelson/github-action-markdown-link-check@v1
```

### Scheduled

```yaml
name: Check Markdown links

on: 
  push:
    branches:
    - master
  schedule:
  - cron: "0 9 * * *"

jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    
    - uses: gaurav-nelson/github-action-markdown-link-check@v1
      with:
        use-quiet-mode: 'yes'
        use-verbose-mode: 'yes'
        config-file: 'mlc_config.json'
        folder-path: 'docs/markdown_files'
```

### On Pull Request

```yaml
on: [pull_request]

name: Check links for modified files

jobs:
  markdown-link-check:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: gaurav-nelson/github-action-markdown-link-check@v1
      with:
        use-quiet-mode: 'yes'
        use-verbose-mode: 'yes'
        check-modified-files-only: 'yes'
```

## Options

Check the marketplace page for full details.

Here are few:

- `use-quiet-mode` - Specify `yes` to only show errors in output.
- `use-verbose-mode` - Specify `yes` to show detailed HTTP status for checked links.
- `folder-path` - Target folder e.g. `"docs"`.

## Disable

```markdown
<!-- markdown-link-check-disable-next-line -->
[Text](target)
```

```markdown
[Text](target) <!-- markdown-link-check-disable-line -->
```

```markdown
<!-- markdown-link-check-disable -->
[Text](target)

<!-- markdown-link-check-enable-->
```
