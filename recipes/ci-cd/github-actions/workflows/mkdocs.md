# MkDocs

Use Python `mkdocs` to build a docs site and automate using GH Actions.


## Example

Includes link checker.

```
name: Build docs

on:
  pull_request:
  push:
    branches:
      - master

jobs:
  link-checker:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - name: Set up Python 3.x
        uses: actions/setup-python@v2

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r docs/requirements.txt

      - name: Build docs
        run: mkdocs build

      - name: Link Checker
        id: lc
        uses: peter-evans/link-checker@v1
        with:
          args: -d ./site -r ./site -x man7.org
      - name: Fail on errors
        run: exit ${{ steps.lc.outputs.exit_code }}
```
