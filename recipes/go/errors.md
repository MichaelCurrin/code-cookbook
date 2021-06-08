---
title: Errors
description: Handle errors in Go
---


## Check function

Save yourself doing 3-line checks for `err != nil` all over and use a `check` function,

```go
func check(e error) {
    if e != nil {
        panic(e)
    }
}
```

Usage:

```go
f, err := os.Open("/tmp/foo.txt")
check(err)
```


## Panic

From [Effective Go](https://golang.org/doc/effective_go#panic).

> real library functions should avoid panic.

If the problem can be masked or worked around, it's always better to let things continue to run rather than taking down the whole program. One possible counterexample is during initialization: if the library truly cannot set itself up, it might be reasonable to panic, so to speak.

```go
var user = os.Getenv("USER")

func init() {
    if user == "" {
        panic("no value for $USER")
    }
}
```


## Recover

> recover is only useful inside deferred functions.

> One application of recover is to shut down a failing goroutine inside a server without killing the other executing goroutines.
