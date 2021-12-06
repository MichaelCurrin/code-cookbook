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

### Conditions

- `release.yml` - Run all steps in the workflow every time, but on a new tag only.
    ```yaml
    on:
      push:
        tags:
          - 'v*'

    jobs:
      build-release:
        # ...
    ```
- `main.yml` - Run the workflow on every push, but only run the release step if running against a tag.
    ```yaml
    on:
      push:
      pull_request:
    
    jobs:
      build-release:
        runs-on: ubuntu-latest
      
        steps:
          # ...
          
          - name: Release Go binaries
            uses: goreleaser/goreleaser-action@v2
            if: startsWith(github.ref, 'refs/tags/')
            # ...
    ```

### Release

This example is based on the Action's docs. Use one of the conditional setups above.

- `main.yml` or `release.yml`
    ```yaml
    name: Go CI
    
    on:
      # ...

    jobs:
      build-release:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎
            uses: actions/checkout@v2
            with:
              fetch-depth: 0

          - name: Set up Go ⚙️
            uses: actions/setup-go@v2
            with:
              go-version: 1.15

          - name: Release Go binaries
            uses: goreleaser/goreleaser-action@v2
            with:
              version: latest
              args: release --rm-dist
            env:
              GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    ```
    
I would guess that if you were to release only and not run tests, you could skip setting up Go in the environment. As the releaser action handles that.


## Example output

See _Assets_ section on the [imgcat@v1.2.0](https://github.com/trashhalo/imgcat/releases/tag/v1.2.0) release:

```
checksums.txt
imgcat_1.2.0_Darwin_x86_64.tar.gz
imgcat_1.2.0_Linux_i386.tar.gz
imgcat_1.2.0_Linux_x86_64.tar.gz
imgcat_1.2.0_Windows_i386.tar.gz
imgcat_1.2.0_Windows_x86_64.tar.gz
```

{% endraw %}
