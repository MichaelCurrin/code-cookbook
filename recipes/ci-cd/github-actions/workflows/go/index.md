---
title: Go
logo: go
---


### How to release

#### Manual

You can skip GitHub Actions.

1. Build locally.
2. Create release in GitHub.
3. Attach build files.

#### Generic actions

See [Build and release assets][] workflows section.

1. Use shell commands in the workflow to build one or more output files, such as for each OS. 
2. Use the generic `create-release` action to make a release.
3. Use the generic `upload-actions` action to attach the files to the new release.

### CI

Use [Go Releaser][] action to handle the steps for you in a single action. This makes it easy to maintain and reuse the workflow across Go projecs. It includes support for compiling across platforms too.


[Build and release assets]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/build-release-assets/index.md %}
[Go Releaser]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/go/go-releaser.md %}


### Related sections

- [Go]({{ site.baseurl }}{% link recipes/go/index.md %}) recipes section.
