# Markdown Link Check

An NPM package to check links in Markdown files.

[![tcort - markdown-link-check](https://img.shields.io/static/v1?label=tcort&message=markdown-link-check&color=142f89&logo=github)](https://github.com/tcort/markdown-link-check)
[![stars - markdown-link-check](https://img.shields.io/github/stars/tcort/markdown-link-check?style=social)](https://github.com/tcort/markdown-link-check)


## Run with GitHub Actions

See [GitHub Action Markdown Link Check][] recipe in the GitHub Actions section.

[GitHub Action Markdown Link Check]: {% link recipes/ci-cd/github-actions/workflows/check-links/gh-action-md-link-check.md %}


## Run NPM CLI tool

### Install

Use `-g` if you want to install globally.

```sh
$ npm install markdown-link-check -D
```

### Run file

You can access the package within a Node script too, but below is just for using the CLI tool.

```sh
$ markdown-link-check https://github.com/tcort/markdown-link-check/blob/master/README.md
```

```sh
$ markdown-link-check README.md
```

### Run on directory

You have to set up logic yourself to run it on a directory.

```sh
$ find . -name '*.md' -exec markdown-link-check {} \;
```

## Run with container

See the docs.
