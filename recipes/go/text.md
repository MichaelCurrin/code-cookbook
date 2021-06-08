---
title: Text
description: Handling text files
---

## Set up

Here are relevant imports and the `check` function, to keep the samples smaller.

```go
import (
    "bufio"
    "fmt"
    "io"
    "io/ioutil"
    "os"
)

func check(e error) {
    if e != nil {
        panic(e)
    }
}
```


## Read

From [Go by Example](https://gobyexample.com/reading-files).

### Read entire file

- `main.go`
    ```go
    func main() {
        dat, err := ioutil.ReadFile("/tmp/dat")
        check(err)
        fmt.Print(string(dat))
    }
    ```

### Read portion of file

Here using `f.Read` to allow reading up to first 5 bytes.

Then using `f.Seek` to go to a known location and read from there.

- `main.go`
    ```go
    func main() {
        f, err := os.Open("/tmp/dat")
        check(err)

        b1 := make([]byte, 5)
        n1, err := f.Read(b1)
        check(err)
        fmt.Printf("%d bytes: %s\n", n1, string(b1[:n1]))

        o2, err := f.Seek(6, 0)
        check(err)
        b2 := make([]byte, 2)
        n2, err := f.Read(b2)
        check(err)
        fmt.Printf("%d bytes @ %d: ", n2, o2)
        fmt.Printf("%v\n", string(b2[:n2]))

        o3, err := f.Seek(6, 0)
        check(err)
        b3 := make([]byte, 2)
        n3, err := io.ReadAtLeast(f, b3, 2)
        check(err)
        fmt.Printf("%d bytes @ %d: %s\n", n3, o3, string(b3))

        // Rewind to start of file.
        _, err = f.Seek(0, 0)
        check(err)

        f.Close()
    }
    ```

> The `io` package provides some functions that may be helpful for file reading. For example, reads like the ones above can be more robustly implemented with `ReadAtLeast`.

Remember to close the file (usually this would be scheduled immediately after Opening with `defer`).

### Using buffered reader

> The `bufio` package implements a buffered reader that may be useful both for its efficiency with many small reads and because of the additional reading methods it provides.

- `main.go`
    ```go
    func main() {
        r4 := bufio.NewReader(f)
        b4, err := r4.Peek(5)
        check(err)
        fmt.Printf("5 bytes: %s\n", string(b4))

        f.Close()
    }
    ```


## Write

From [Go by Example](https://gobyexample.com/writing-files).

### Basic

Write entire file

Dump a string (or bytes) into a file.

- `main.go`
    ```go
    func main() {
        d1 := []byte("hello\ngo\n")
        err := ioutil.WriteFile("/tmp/dat1", d1, 0644)
        check(err)
    }
    ```

### Open a file for writing

For more control, open the file then writing strings or bytes to it.

It’s idiomatic to defer a `Close` immediately after opening a file.

Issue a Sync to flush writes to stable storage.

- `main.go`
    ```go
    func main() {
        f, err := os.Create("/tmp/dat2")
        check(err)

        defer f.Close()

        d2 := []byte{115, 111, 109, 101, 10}
        n2, err := f.Write(d2)
        check(err)
        fmt.Printf("wrote %d bytes\n", n2)

        n3, err := f.WriteString("writes\n")
        check(err)
        fmt.Printf("wrote %d bytes\n", n3)

        f.Sync()
    ```

### Use buffered writer

Use `bufio` to get a buffered writer.

Use `Flush` to ensure all buffered operations have been applied to the underlying writer.

- `main.go`
    ```go
    func main() {
        w := bufio.NewWriter(f)
        n4, err := w.WriteString("buffered\n")
        check(err)
        fmt.Printf("wrote %d bytes\n", n4)

        w.Flush()
    }
    ```
