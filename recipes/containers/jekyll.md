---
logo: jekyll
description: How to run a Jekyll site in a container
---
# Jekyll

## Purpose

Running Jekyll in as container executable is useful for development across operatings and also means you don't have to worry about getting Ruby installed and setup. This makes it easier for other developers to use your project. You can also use these commands in a CI flow if you want, which is actually where initially found one of the commands.

## Notes

Note that using a `Dockerfile` file and docker compose (with volumes) might be lighter to do than using the Jekyll container executable approach below. Maybe with `make` too. But below are low-level commands.

Steps are based on an [article](https://ddewaele.github.io/running-jekyll-in-docker/), though that is similar what is in the Jekyll docker [docs](https://github.com/envygeeks/jekyll-docker#readme).

For using container steps in CI, see the [GH Actions]({{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/jekyll/build.md %}) page relating to Jekyll.


## Images

Here links to images on the Docker Hub website under the [jekyll](https://hub.docker.com/u/jekyll) user profile. The standard image will be used in teh next sections but you can change it out.

- [jekyll/jekyll](https://hub.docker.com/r/jekyll/jekyll) image - standard.
- [jekyll/builder](https://hub.docker.com/r/jekyll/builder) image - includes tools.
- [jekyll/minimal](https://hub.docker.com/r/jekyll/minimal) image - very minimal image.


## Set Jekyll version

Set an environment variable on your host machine.

```sh
export JEKYLL_VERSION=4
```

Note that only `3.8` and `4` or higher are available, while `3.9` is not. See [tags](https://hub.docker.com/r/jekyll/jekyll/tags?page=1&ordering=last_updated).

The appropriate Jekyll image will be downloaded when running a command below - you don't have to download it explicitly.


## Usage

Run the commands below on your **host** machine.

### Notes

- Note that `-i` might not actually be needed here but was copied.
- The `--rm` flag will delete a container after it is run. Useful if you want to run the Jekyll container as an executable. Using volumes, the output will be persised outside the container. But you should leave out the flag when you want to perist gems inside the container.
- We use the `volume` flag so that we can mount the project in the container as `/srv/jekyll`. Any operations in the container like gems in `vendor` and output in `_site` are persisted on the host.

### Create new Jekyll project

```sh
$ mkdir my-blog
$ cd my-blog
```

```sh
$ docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll new .
```

```
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux-musl]
Running bundle install in /srv/jekyll... 
  Bundler: Fetching gem metadata from https://rubygems.org/..........
  Bundler: Fetching gem metadata from https://rubygems.org/.
  Bundler: Resolving dependencies...
  Bundler: Using public_suffix 4.0.6
...
```

As you can see, that creates installs gems using Bundler after setting up the files.

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

Install a gem inside the persistent container. 

#### Using gem command

Here we install a theme, as recommended in a doc.

```sh
$ docker exec -it blog \
  gem install jekyll-theme-hydeout
```

Note use of `gem` as system-wide gems, since you are working in a dedicated container. Normally you'd use `bundle` for your project, outside a container.

### Using Bundler

I can't find any way to read a Gemfile with `gem` command. So then you need to use Bundler.

You don't have to install Bundler, as the images come with it.

```sh
$ docker exec -it blog \
  bundle install
```

### Start interactive shell

If you want to have a look at the state of files or maybe gems in the container, you can start the container interactive mode.

```sh
$ docker exec -it blog bash
```
