---
title: Setup Go
---

Repo: [actions/setup-go](https://github.com/actions/setup-go)

>  Set up your GitHub Actions workflow with a specific version of Go 


## Sample

### Download Go

```yaml
steps:
  - name: Set up Go
    uses: actions/setup-go@v2
    with:
      go-version: 1.15
```

### Run Go in your project

```yaml
steps:
  - uses: actions/checkout@v2
  
  - uses: actions/setup-go@v2
    with:
      go-version: '^1.13.1'
      
  - run: go version
```
