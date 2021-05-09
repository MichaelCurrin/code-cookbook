# Fields

## Build command

Use any shell command or commands for the build parameter.

e.g.

- `jekyll build`
- `npm run build && jekyll build`
- `./fetch_data.sh && cp foo bar/ && make build`

## Tasks

For Node, define tasks in package.json otherwise you can use a `Makefile`.

It is a good idea to use a `make` command so that what you run locally to test a prod build and what you run on Netlify are the same. You could even include running unit and integration tests, fetching data and actually doing the build, all in a single command.

e.g.

```sh
$ make build-prod
```

For a simple Jekyll project, it could be this, using the trace flag for verbose errors.

```make
build-prod:
    JEKYLL_ENV=prod bundle exec jekyll build --trace
```

## Headers format

There is a lot you can specify in the config. Here are some header settings which allows doing cross-origin requests to use JS to get data from an API.

```toml
[[headers]]
  for = "/*"
    [headers.values]
    Access-Control-Allow-Origin = "*"
```

Alternatives:

```
Access-Control-Allow-Origin = "example.com"
Access-Control-Allow-Origin = ["example.com", "test.com"]
```
