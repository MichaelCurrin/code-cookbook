---
logo: jekyll
---
# Jekyll
> How to run a Jekyll site in a container


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
