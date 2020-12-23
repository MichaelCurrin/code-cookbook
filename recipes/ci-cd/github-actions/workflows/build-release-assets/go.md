---
logo: go
description: How to build and release assets for a Go project
---
# Go


## Go Releaser

This tool helps build your application for several platforms.

### Resources

- [Homepage](https://goreleaser.com/)
- [Quickstart](https://goreleaser.com/quick-start/)
- [GitHub Actions](https://goreleaser.com/ci/actions/) section


### Sample

There is a GitHub Actions action you can use in your CI.

- `release.yml` from the docs.
    ```
    name: goreleaser

    on:
      pull_request:
      push:

    jobs:
      goreleaser:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout
            uses: actions/checkout@v2
            with:
              fetch-depth: 0

          - name: Set up Go
            uses: actions/setup-go@v2
            with:
              go-version: 1.15

          - name: Run GoReleaser
            uses: goreleaser/goreleaser-action@v2
            with:
              version: latest
              args: release --rm-dist
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```
- On new tag only.
    ```yaml
    on:
      push:
        tags:
          - '*'
    ```
- Or on a condition.
    ```yaml
    - name: Run GoReleaser
      uses: goreleaser/goreleaser-action@v2
      if: startsWith(github.ref, 'refs/tags/')
      with:
        version: latest
        args: release --rm-dist
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```

Sample result on an [imgcat](https://github.com/trashhalo/imgcat/releases/tag/v1.2.0) release:

```
checksums.txt
imgcat_1.2.0_Darwin_x86_64.tar.gz
imgcat_1.2.0_Linux_i386.tar.gz
imgcat_1.2.0_Linux_x86_64.tar.gz
imgcat_1.2.0_Windows_i386.tar.gz
imgcat_1.2.0_Windows_x86_64.tar.gz
```
