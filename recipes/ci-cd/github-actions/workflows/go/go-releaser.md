---
description: And action to build and release assets for a Go project
---
# Go Releaser

{% raw %}

This action helps build your Go application for several platforms in your CI.

Note you should still set up Go in workflow, using `setup-go` as per the doc's example below.

The Go Releaser action handles building assets attaching to a release. I need to look more into the action docs to see how it knows what to release.


## Resources

- [Homepage](https://goreleaser.com/)
- [Quickstart](https://goreleaser.com/quick-start/)
- [GitHub Actions](https://goreleaser.com/ci/actions/) section


## Samples

- `release.yml` - from the docs.
    ```yaml
    name: goreleaser

    on:
      push:
      pull_request:

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
          - 'v*'
    ```
- Or on a condition.
    ```yaml
    steps:
      - name: Run GoReleaser
        uses: goreleaser/goreleaser-action@v2
        if: startsWith(github.ref, 'refs/tags/')
        with:
          version: latest
          args: release --rm-dist
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```

That last flow recommend in the doc lets you run your entire workflow on every push but only release on a tag - perhaps checking event type is "tag" is similar would be more in keeping in GH Actions convention.

## Example output

See Assets section on the [imgcat@v1.2.0](https://github.com/trashhalo/imgcat/releases/tag/v1.2.0) release:

```
checksums.txt
imgcat_1.2.0_Darwin_x86_64.tar.gz
imgcat_1.2.0_Linux_i386.tar.gz
imgcat_1.2.0_Linux_x86_64.tar.gz
imgcat_1.2.0_Windows_i386.tar.gz
imgcat_1.2.0_Windows_x86_64.tar.gz
```

{% endraw %}
