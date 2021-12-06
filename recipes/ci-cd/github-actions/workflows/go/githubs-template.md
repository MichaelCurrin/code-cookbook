---
title: GitHub's Template
description: The workflow that GH Actions suggests to you for a Go project
---

## Sample

The filename and contents that GH recommends to you:

- `go.yml`
    ```yaml
    name: Go

    on:
      push:
        branches: [ master ]
      pull_request:
        branches: [ master ]

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - uses: actions/checkout@v2

        - name: Set up Go
          uses: actions/setup-go@v2
          with:
            go-version: 1.15

        - name: Build
          run: go build -v ./...

        - name: Test
          run: go test -v ./...
    ```
