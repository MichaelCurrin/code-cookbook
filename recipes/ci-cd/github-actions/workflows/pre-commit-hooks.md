---
title: Pre-commit hooks
---

Here we use linters and pre-commit hooks on GH Actions - I don't know how this actually works or is useful but it is here for when I need it.

See [pre-commit/pre-commit-hooks](https://github.com/pre-commit/pre-commit-hooks) repo - good for use with Python

See also the [Hooks](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/git/committing/hooks.html) section of Dev Cheatsheets repo.


## Example

- From Poetry repo - `.pre-commit-config.yaml`. Note use of `pre-commit-hooks`.
    ```yaml
    repos:
      - repo: https://github.com/psf/black
        rev: stable
        hooks:
          - id: black

      - repo: https://gitlab.com/pycqa/flake8
        rev: 3.7.8
        hooks:
          - id: flake8

      - repo: https://github.com/timothycrosley/isort
        rev: 4.3.21-2
        hooks:
          - id: isort
            additional_dependencies: [toml]
            exclude: ^.*/?setup\.py$

      - repo: https://github.com/pre-commit/pre-commit-hooks
        rev: v2.3.0
        hooks:
          - id: trailing-whitespace
            exclude: ^tests/.*/fixtures/.*
          - id: end-of-file-fixer
            exclude: ^tests/.*/fixtures/.*
          - id: debug-statements
    ```

## Actions

- `.github/workflows/main.yml`
    ```yaml
    jobs:
      linting:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v2
          
          - name: Set up Python 3.8
            uses: actions/setup-python@v1
            with:
              python-version: 3.8
              
          - name: Linting
            run: |
              pip install pre-commit
              pre-commit run --all-files
    ```
