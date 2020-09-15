# Web server


## Basic

A short script with no external dependencies.

```go
package main

import (
	"log"
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("./"))
	log.Fatal(http.ListenAndServe(":9000", fs))
}
```

## More detailed

Based on [Learn X in Y](https://learnxinyminutes.com/docs/go/).

```go
package main

import (
	"fmt"
	"io/ioutil" // Implements some I/O utility functions.
	"net/http"  // Yes, a web server!
)

// Define pair as a struct with two fields, ints named x and y.
type pair struct {
	x, y int
}

// Make pair an http.Handler - implement its only method.
func (p pair) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	// Serve data with a method of http.ResponseWriter.
	w.Write([]byte("Hello, world!"))
}

func requestServer() {
	resp, err := http.Get("http://localhost:8080")
	fmt.Println(err)

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	fmt.Printf("\nWebserver said: `%s`", string(body))
}

func main() {

	go func() {
		// TCP address and interface (http.Handler).
		err := http.ListenAndServe(":8080", pair{})
		fmt.Println(err) // Don't ignore errors
	}()

	requestServer()
}
```
