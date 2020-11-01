# Configure
> How to setup a Netlify build using the UI or a config file


## Why use a config file

You don't need a config file. You can configure values in the UI including build command and output directory.

But for repeatable builds (across Netlify accounts or sites) and for keeping the value in version control, a config file in your repo is great. It will override the UI options. 

Note that either way you don't need to specify an install command or caching dependencies - Netlify will do this for you based on the presence of a package file - Gemfile or yarn.lock file for example.


## Resources

See Netlify's docs:

- Configure builds
    - [Get started](https://docs.netlify.com/configure-builds/get-started/)
    - [File-based configuration](https://docs.netlify.com/configure-builds/file-based-configuration/)
    - [YAML and JSON file support](https://docs.netlify.com/configure-builds/file-based-configuration/#json-and-yaml-configuration-files)


## Sample configs

Netlify's config file is `netlify.toml`. It should be at the root of the repo. Indentation should be two spaces. Just push your master branch from your machine or edit on GitHub and a Netlify build will run using your config settings.

The minimum config two params under `[build]` as below.

- `command` - what shell command to run to build the app (dependencies are already installed by then)
- `publish` - which output directory to serve as a site. This directory is usually unversioned in git.

### Generic

```toml
[build]
  command = "tool build_cmd"
  publish = "out_dir"
```

Note you could use `./foo` as the publish directory if you want to be more verbose 

### Jekyll prod build

```toml
[build]
  command = "jekyll build"
  publish = "_site"

[build.environment]
  JEKYLL_ENV = "production"
```

Note that Netlify works well with Bundle use or not. It uses it either anyway. I use Bundle locally.

```toml
command = "bundle exec jekyll build"
```

### Node app

Your output directory might be something than `build`, such as `dist` or `out`. You might also build testing and linting into your build command.

Using NPM.

```toml
[build]
  command = "npm test && npm run build"
  publish = "build"
```

Using Yarn.

```toml
[build]
  command = "yarn test && yarn build"
  publish = "build"
```


## Fields

### Build command

Use any shell command or commands for the build parameter.

e.g.

- `jekyll build`
- `npm run build && jekyll build`
- `./fetch_data.sh && cp foo bar/ && make build`

### Tasks

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

### Headers format

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
