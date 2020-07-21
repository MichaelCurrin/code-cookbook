# Super linter

A GitHub Action that lints across multiple languages.

See also [Super linter](/recipes/ci-cd/github-actions/workflows/linting/super-linter.md) in the GH workflows section of this project.

This is very verbose covering languages I don't use and also the markdown linting can be noisy or too strict when it is not my focus.

However, this action is a good working example of all the linters on GitHub Actions, so I can unbundle them.

- [Super Linter](https://github.com/marketplace/actions/super-linter) in Marketplace
    [Support linters](https://github.com/marketplace/actions/super-linter#supported-linters) table
- [github/super-linter](https://github.com/github/super-linter) repo
    - [Dockerfile](https://github.com/github/super-linter/blob/master/Dockerfile) - this uses a lot of `FROM` lines.
    - [linter.sh](https://github.com/github/super-linter/blob/master/lib/linter.sh) which does the work.
        - See for example 
            - `shellcheck --color`
            - `pylint --rcfile ...`
            - `rubocop -c ...`
            - `markdownlint`
            - `jsonlint`
            
