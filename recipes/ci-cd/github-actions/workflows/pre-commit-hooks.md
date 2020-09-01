---
title: Pre-commit hooks
description: How to use pre-commit hooks on GH Actions
---

Here we we pre-commit hooks to apply lint fixes Actions. One could also run the hook locally as a pre-commit hook and I don't know the value of doing this in CI, but this is here anyway as a reference for when I need it.

See also [Hooks](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/git/hooks.html) section of my Dev Cheatsheets repo.


## Samples

### Use Pre-commit hooks

 Note use of `pre-commit-hooks` and how black, flake8 and isort are reference by repo (presumambly because Poetry is a replacement for pip and doesn't want to use pip to install).

- From Poetry repo - `.pre-commit-config.yaml`.
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

### Python pre-commit

Use of Python `pre-commit` package when linting. This alone won't persist changes without using a token.

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
