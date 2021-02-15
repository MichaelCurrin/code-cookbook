---
title: Setup Go
---

{% raw %}

Repo: [actions/setup-go](https://github.com/actions/setup-go)

> Set up your GitHub Actions workflow with a specific version of Go 


## Samples

### Download a single Go version

The Go version will be the **latest** unless you specify a version.

Previously downloaded versions will be used from **cache**, to save on downloading. Which means if omit the version, I think you'd end up loading from cache 1.15 even when 1.18 is latest.

```yaml
steps:
  - name: Set up Go
    uses: actions/setup-go@v2
    with:
      go-version: 1.15
```

Or a version range like `'^1.13.1'`.

Sample output:

```
Run actions/setup-go@v2

Setup go stable version spec 1.15
Found in cache @ /opt/hostedtoolcache/go/1.15.6/x64
Added go to the path
Successfully setup go version 1.15
go version go1.15.6 linux/amd64

go env
  GO111MODULE=""
  GOARCH="amd64"
  GOBIN=""
  ...
```

### Download and run Go in your project

Here is the Action with more steps around it.

```yaml
steps:
  - uses: actions/checkout@v2
  
  - uses: actions/setup-go@v2
    with:
      go-version: '^1.13.1'
      
  - run: go version
  
  - run: go run hello.go
```

### Load Go version dynamically

Use `grep` to find the version in `go.mod` file. 

This stores `GO_VERSION=1.15` in a file that named using `$GITHUB_ENV`.

That file is then read in the next step.

```yaml
steps:
  - uses: actions/checkout@v2
  
  - name: Get Go version
    run: echo "GO_VERSION=$(grep 'go \d\.' go.mod | cut -d ' ' -f 2)" >> $GITHUB_ENV
    
  - uses: actions/setup-go@v2
    with:
      go-version: ${{ env.GO_VERSION }}
```

Thanks to comment [here](https://github.com/actions/setup-go/issues/23#issuecomment-732276072) on a `setup-go` issue.

Or load from `Dockerfile`.

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v2

  - name: Get Go version
    id: vars
    run: |
      echo ::set-output name=go_version::$(grep '^FROM go' .github/go/Dockerfile | cut -d ' ' -f 2 | cut -d ':' -f 2)
      echo "Using Go version ${{ steps.vars.outputs.go_version }}"

  - name: Setup Go
    uses: actions/setup-go@v2
    with:
      go-version: ${{ steps.vars.outputs.go_version }}
```

### Matrix version

How to run against multiple Go version. Based on the action's doc.

```yaml
jobs:
  build:
    runs-on: ubuntu-16.04
    
    strategy:
      matrix:
        go: [ '1.14', '1.13' ]
        
    name: Go ${{ matrix.go }}
    
    steps:
      - uses: actions/checkout@v2
      - name: Setup go
        uses: actions/setup-go@v1
        with:
          go-version: ${{ matrix.go }}
          
      - run: go run hello.go
```

{% endraw %}
