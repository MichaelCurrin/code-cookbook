---
logo: jekyll
---
# Jekyll
> How to run a Jekyll site in a container

Note that using a `Dockerfile` file and docker compose might be lighter to do. Maybe with `make` too. But here are low-level commands.


Based on [article](https://ddewaele.github.io/running-jekyll-in-docker/).


## Setup

Set an environment variable.

```sh
export JEKYLL_VERSION=3.9
```

The appropriate Jekyll image will be downloaded when needed.


## Create

```sh
$ mkdir my-blog
$ cd my-blog

$ docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll new .
```


## Build

As above but in one line and with different command.

```sh
$ docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll:$JEKYLL_VERSION jekyll build
```


## Serve

```sh
$ docker run --name blog \
  --volume="$PWD:/srv/jekyll" \
  -p 3000:4000 \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve --watch --drafts
```

If you run as a daemon, you can restart like this:

```sh
$ docker restart blog
```


## Run commands

Install a theme. You might prefer bundle to gem though, as an command above used bundler.

```sh
$ docker exec -it blog \
  gem install "jekyll-theme-hydeout"
```


## Start shell

```sh
$ docker exec -it blog bash
```
