---
description: How to build a CLI tool that parses arguments
---
# CLI


## The Urfave CLI package

Repo: [urfave/cli](https://github.com/urfave/cli)

From [V2 manual](https://github.com/urfave/cli/blob/master/docs/v2/manual.md#getting-started).

See also [video](https://youtu.be/i2p0Snwk4gc).

### Minimal

- `main.go`
    ```go
    package main

    import (
        "os"

        "github.com/urfave/cli/v2"
    )

    func main() {
        (&cli.App{}).Run(os.Args)
    }
    ```

### Greet

- `greet.go`
    ```go
    package main

    import (
        "fmt"
        "log"
        "os"

        "github.com/urfave/cli/v2"
    )

    func main() {
        app := &cli.App{
            Name: "greet",
            Usage: "fight the loneliness!",
            Action: func(c *cli.Context) error {
                fmt.Println("Hello friend!")
                return nil
            },
    }

    err := app.Run(os.Args)
        if err != nil {
            log.Fatal(err)
        }
    }
    ```

Install it.

```sh
$ go install
```

Run it.

```sh
$ greet
Hello friend!
```

View the help with `help` or `h`  command or the `--help` or `-h` flag.

```sh
$ greet help
```
```
NAME:
    greet - fight the loneliness!

USAGE:
    greet [global options] command [command options] [arguments...]

COMMANDS:
    help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS
    --help, -h  show help (default: false)
```


## The Flag package

Set up an argument parser with `flag`.

- `main.go`
    ```go
    import (
        "flag"
        "fmt"
        "html/template"
        "log"
        "net/http"
    )

    var ADDRESS = flag.String("addr", ":8000", "http service address")

    func main() {
        fmt.Printf("Starting server on http://localhost%v/ ...\n", *ADDRESS)

        // ...
    }
    ```

e.g.

```sh
$ go run main.go -h
```
```
Usage of .../main
  -addr string
        http service address (default ":8000")
```

```
$ go run main.go
$ go run main.go --addr :9000
```


## MitchellH CLI package

Using [mitchellh/cli](https://github.com/mitchellh/cli).

- `main.go`
    ```go
    package main

    import (
        "log"
        "os"

        "github.com/mitchellh/cli"
    )

    func main() {
        c := cli.NewCLI("app", "1.0.0")
        c.Args = os.Args[1:]
        c.Commands = map[string]cli.CommandFactory{
            "foo": fooCommandFactory,
            "bar": barCommandFactory,
        }

        exitStatus, err := c.Run()
        if err != nil {
            log.Println(err)
        }

        os.Exit(exitStatus)
    }
    ```


## Cobra package

From [gopinath-langote/1build](https://github.com/gopinath-langote/1build).

- `1build.go`
    ```go
    package main

    import "github.com/gopinath-langote/1build/cmd"

    func main() {
        cmd.Execute()
    }
    ```
- `cmd/root.go`
    ```go
    package cmd

    import (
        "github.com/spf13/cobra"
    )

    // Cmd cobra for root level
    var Cmd = &cobra.Command{
        // ...
    }

    // Execute entry-point for cobra app
    func Execute() {
        if err := Cmd.Execute(); err != nil {
            fmt.Println(err)
            utils.ExitError()
        }
    }

    func init() {
        // ...
    }
    ```
    
