---
title: Go
logo: go
---

To release your Go binaries:

- Build one or more output files - one for each OS. Then use a generic `create-release` and `upload-actions` actions to attach to a new release. See [Build and release assets]({{ site.baseurl }}{% ci-cd/github-actions/workflows/build-release-assets/index.md %}) workflows section.
- Use [Go Releaser]({{ site.baseurl }}{% ci-cd/github-actions/workflows/go/go-releaser.md %}) to do that for you. One of the benefits is that it will compile across platforms.