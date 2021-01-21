---
title: Setup Go
---

Repo: [actions/setup-go](https://github.com/actions/setup-go)

>  Set up your GitHub Actions workflow with a specific version of Go 


## Sample

### Download a single Go version

```yaml
steps:
  - name: Set up Go
    uses: actions/setup-go@v2
    with:
      go-version: 1.15
```

### Download and run Go in your project

```yaml
steps:
  - uses: actions/checkout@v2
  
  - uses: actions/setup-go@v2
    with:
      go-version: '^1.13.1'
      
  - run: go version
  
  - run: go run hello.go
```

### Matrix version

Based on the action's doc.

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
