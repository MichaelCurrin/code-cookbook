---
description: How to build a CLI tool that parses arguments
---
# CLI


## CLI package

Repo: [urfave/cli](https://github.com/urfave/cli)

From [V2 manual](https://github.com/urfave/cli/blob/master/docs/v2/manual.md#getting-started).

See also [video](https://youtu.be/i2p0Snwk4gc).

### Minimal

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

Install and run it.

```sh
$ go install
$ greet
Hello friend!
```

Show help with `help` command or `--help` flag.

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
