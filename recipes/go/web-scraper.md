# Web scraper

## Using HTTP

See [http](https://golang.org/pkg/net/http/) package. Examples from the docs.

> When err is nil, resp always contains a non-nil resp.Body. Caller should close resp.Body when done reading from it. 

- `main.go`
	```go
	package main

	import (
		"fmt"
		"io/ioutil"
		"log"
		"net/http"
	)

	func main() {
		res, err := http.Get("https://www.google.com/robots.txt")
		if err != nil {
			log.Fatal(err)
		}
		robots, err := ioutil.ReadAll(res.Body)
		res.Body.Close()
		if err != nil {
			log.Fatal(err)
		}
		fmt.Printf("%s", robots)
	}
	```


Based on [post](https://itnext.io/create-your-first-web-scraper-in-go-with-goquery-2dcd45743165)

- `main.go`
	```go
	package main

	import (
		"fmt"
		"io/ioutil"
		"net/http"
	)

	func fetch(url string) {
		resp, err := http.Get(url)
		if err {
			fmt.Println(err)
		}

		defer resp.Body.Close()

		if resp.StatusCode == 200 {
		  bodyText, err := ioutil.ReadAll(resp.Body)
		  if err {
			fmt.Println(err)
		  }

		  fmt.Sprintf("%s\n", bodyText)
		}
	}

	func main() {
		fetch("https://example.com)
	}
	```


## Using Colly

[![gocolly - colly](https://img.shields.io/static/v1?label=gocolly&message=colly&color=blue&logo=github)](https://github.com/gocolly/colly)

> Lightning Fast and Elegant Scraping Framework for Gophers

Colly provides a clean interface to write any kind of crawler/scraper/spider.

With Colly you can easily extract structured data from websites, which can be used for a wide range of applications, like data mining, data processing or archiving.


Examples from the repo. See [Examples](https://github.com/gocolly/colly/tree/master/_examples) directory for more.


### Basic

Set some attributes and callback functions on an instance then start the scraper with `.Visit`.

- `go.mod`
    ```go
    module github.com/x/y

    go 1.14

    require (
            github.com/gocolly/colly/v2 latest
    )
    ```
- `main.go`
    ```go
    func main() {
      c := colly.NewCollector()

      // Find and visit all links
      c.OnHTML("a[href]", func(e *colly.HTMLElement) {
        e.Request.Visit(e.Attr("href"))
      })

      c.OnRequest(func(r *colly.Request) {
        fmt.Println("Visiting", r.URL)
      })

      c.Visit("http://go-colly.org/")
    }
    ```

Or as one script.

```sh
$ go run main.go
```

- `basic.go`
    ```go
    package main

    import (
      "fmt"

      "github.com/gocolly/colly/v2"
    )

    func main() {
      c := colly.NewCollector(
        colly.AllowedDomains("hackerspaces.org", "wiki.hackerspaces.org"),
      )

      c.OnHTML("a[href]", func(e *colly.HTMLElement) {
        link := e.Attr("href")
        fmt.Printf("Link found: %q -> %s\n", e.Text, link)
        c.Visit(e.Request.AbsoluteURL(link))
      })

      c.OnRequest(func(r *colly.Request) {
        fmt.Println("Visiting", r.URL.String())
      })

      c.Visit("https://hackerspaces.org/")
    }
    ```
