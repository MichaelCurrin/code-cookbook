---
logo: jekyll
description: How to run a Jekyll site in a container
---
# Jekyll

Note that using a `Dockerfile` file and docker compose might be lighter to do. Maybe with `make` too. But here are low-level commands.


Steps are based on an [article](https://ddewaele.github.io/running-jekyll-in-docker/), though that is similar what is in the Jekyll docker [docs](https://github.com/envygeeks/jekyll-docker#readme).

For using container steps in CI, see the [GH Actions]({{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/jekyll/build.md %}) page relating to Jekyll.


## Images

Links to images on the Docker Hub website.

- [jekyll](https://hub.docker.com/u/jekyll) user
- [jekyll/jekyll](https://hub.docker.com/r/jekyll/jekyll) image - standard.
- [jekyll/builder](https://hub.docker.com/r/jekyll/builder) image - includes tools.
- [jekyll/minimal](https://hub.docker.com/r/jekyll/minimal) image - very minimal image.

The standard image is used in the examples below, but you can change it out.


## Setup

Set an environment variable.

```sh
export JEKYLL_VERSION=3.9
```

Note that only `3.8` and `4` or higher are available, `3.9` is not. See [tags](https://hub.docker.com/r/jekyll/jekyll/tags?page=1&ordering=last_updated).

The appropriate Jekyll image will be downloaded when running a command.


## Usage

Note that `-i` might not actually be needed here but was copied.

The `--rm` flag will delete a container after it is run. Useful if you want to run the Jekyll container as an executable. Using volumes, the output will be persised outside the container. But you should leave out the flag when you want to perist gems inside the container.

### Create site

```sh
$ mkdir my-blog
$ cd my-blog

$ docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll new .
```

Note we use volume flag so that we can mount the project in the container as `/srv/jekyll`. Any operations in the container like gems in `vendor` and output in `_site` are persisted on the host.


### Build site

```sh
$ docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll build
```


### Run dev server

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

### Install gem

Install a gem inside the contain. Here we install a theme.

```sh
$ docker exec -it blog \
  gem install "jekyll-theme-hydeout"
```

TBC - how to install from the `Gemfile`.

### Start interactive shell

If you want to have a look at the state of files or maybe gems in the container, you can start the container interactive mode.

```sh
$ docker exec -it blog bash
```
