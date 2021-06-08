# Templating


## Web server wrapper

Based on the [Effective Go](https://golang.org/doc/effective_go#web_server) web server example.

There is a service at `chart.apis.google.com` for formatting of charts and graphs, including a QR code. But it is tricky to use by URL. The program provides an interface to receive text, call the chart server and produce a QR code, which can be read by a cell phone camera.

Note chart type `qr` in the URL.

- `main.go`
    ```go
    package main

    import (
        "fmt"
        "html/template"
        "log"
        "net/http"
    )

    const ADDRESS = ":8000"

    const TEMPLATE_STR = `
        <html>
        <head>
            <title>QR Link Generator</title>
        </head>

        <body>
            <h1>QR Link Generator</h1>

            {{if .}}
                <img src="http://chart.apis.google.com/chart?chs=300x300&cht=qr&choe=UTF-8&chl={{.}}" />
                <br>
                {{.}}
                <br>
                <br>
            {{end}}

            <form action="/" name=f method="GET">
                <input name="s" value="" title="Text to QR Encode" maxLength=1024 size=70 >

                <input type="submit" name="qr" value="Show QR" >
            </form>
        </body>
        </html>
    `

    var TEMPLATE = template.Must(template.New("qr").Parse(TEMPLATE_STR))

    func QR(w http.ResponseWriter, req *http.Request) {
        TEMPLATE.Execute(w, req.FormValue("s"))
    }

    func main() {
        http.Handle("/", http.HandlerFunc(QR))

        fmt.Printf("Starting server on http://localhost%v/\n", ADDRESS)

        err := http.ListenAndServe(ADDRESS, nil)
        if err != nil {
            log.Fatal("ListenAndServe:", err)
        }
}
    ```

```sh
$ go run main.go
```

Then open the browser at:

- http://localhost:8000/

Start on a custom port:

```sh
go run main.go --addr :9000
```

In the form, enter an HTTP URL. You can enter "Hello world" but that can't be found by a browser.

See the [Image Charts](https://developers.google.com/chart/image/docs/making_charts) documentation or the [QR](https://developers.google.com/chart/infographics/docs/qr_codes) docs.

Sample URL:

```
https://chart.googleapis.com/chart?
  cht=p3&
  chs=250x100&
  chd=t:60,40&
  chl=Hello|World
```

```
https://chart.googleapis.com/chart?
    cht=qr
    chl=Hello+world
    choe=UTF-8
```

See the [html/template](https://golang.org/pkg/html/template/) docs for more info.
