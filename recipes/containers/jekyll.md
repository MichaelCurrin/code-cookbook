---
logo: jekyll
description: How to run a Jekyll site in a container
---
# Jekyll

## Purpose

Running Jekyll and Bundler using a container executable is useful for development across operating systems and also means you don't have to worry about getting Ruby installed and setup. This makes it easier for other developers to use your project. 

You can also use these commands in a CI flow if you want, which is actually where initially found one of the commands.


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

- Steps are based on the Jekyll Docker repo's [docs](https://github.com/envygeeks/jekyll-docker#readme) and an article titled [Running Jekyll in Docker](https://ddewaele.github.io/running-jekyll-in-docker/).
- Using a `Dockerfile` file and docker compose (with volumes) might more convenient (less to type) than using the Jekyll container executable approach here. Maybe using `make` instead (though that is not standard on Windows). Note that `Dockerfile` is useful if you need to add Node.js to your container and you can still use volumes so you can edit code on the host. See the end of this guide.
- On this page below are low-level commands which means more to type (or paste) each time but they don't rely on any configs like `Dockerfile`, so are easy to experiment with.
- For using container steps in CI, see the [GH Actions]({{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/jekyll/build.md %}) page relating to Jekyll.
- The `--rm` flag will delete a container after it is run. Useful if you want to run the Jekyll container as an executable. Using volumes, the output will be persised outside the container. But you should leave out the flag when you want to perist gems inside the container.
- We use the `volume` flag so that we can mount the project in the container as `/srv/jekyll`. Any operations in the container like gems in `vendor` and output in `_site` are persisted on the host.

### Create new site

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
  jekyll build --trace
```

Check the results on the host:

```sh
$ ls _site/
$ ls vendor/bundle/ruby/2.7.0/gems/
```

### Run dev server

This one command will install gems to your host's `vendor` directory using `bundle install`, then start a dev server.

```sh
$ docker run --name blog \
  --volume="$PWD:/srv/jekyll" \
  -p 4000:4000 \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll serve --trace
```

Then open in the browser:

- [localhost:4000](http://localhost:4000)

Cancel to stop the container.

The command above is from the docs, but I recommend adding `--rm` to remove the container and everytime you run the command it will install gems. If you don't use `--rm`, you'll get an error on running the command again saying the name is in use and you need to remove or rename.

Or leave out `--rm` and use this to start the stopped container again, which is quicker and shorter to type. It will skip installing gems though.

```sh
$ docker start blog
$ docker stop blog
$ docker restart blog
```

You can also run the initial run command using `-d`. Unfortunately when doing that or running `start`, you can't see the output so also need a log command. While run with `--rm` covers you for logging.

### Install gems

Note that `bundle install` seems to run whenever a command is run in the container, so you don't have to run it yourself.

Note that the container must be running for `docker exec` to work. You don't have to specify volume here as it is already in use.

Here we install a theme, as recommended in the doc.

```sh
$ docker exec -it blog \
  gem install jekyll-theme-hydeout
```

Note use of `gem` as system-wide gems, since you are working in a dedicated container. Normally you'd use `bundle` for your project, outside a container.

### Start interactive shell

If you want to have a look at the state of files or maybe gems in the container, you can start the container interactive mode.

```sh
$ docker exec -it blog bash
```


## Use in Dockerfile
> How to use the Jekyll image in a Dockerfile

Use `apk`, the Alphine Linux package manager. That is used within the [jekyll Dockerfile](https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile). See [tutorial](https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/).

```Dockefile
FROM node:14

FROM jekyll/jekyll

RUN apk update
RUN apk add sqlite
```

If you want to use `apt-get`, you must used it before `jekyll` otherwise it will not be found.

```Dockerfile
FROM node:14

RUN apt-get update
RUN apk install -y \
  sqlite

FROM jekyll/jekyll
```

When you use the Jekyll image in Dockerfile, you lose the entry point, so the container will do nothing.

You can add the steps from the image's Dockerfile.

```Dockefile
CMD ["jekyll", "--help"]
ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
```

If you don't provide any arguments, it just shows the Jekyll command help.

See the [entrypoint](https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/copy/all/usr/jekyll/bin/entrypoint) script in the repo. It seems when I run the container, if you command starts with `jekyll` then it will run the `bundle install` steps for you but not if you do something else.

```sh
$ docker build --rm -t my_app:latest .
```

```sh
$ docker run foo
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux-musl]
jekyll 4.2.0 -- Jekyll is a blog-aware, static site generator in Ruby

Usage:

  jekyll <subcommand> [options]
...
```

Start dev server:

```sh
$ docker run --rm \
  -p 4000:4000 \
  --volume "$PWD:/srv/jekyll" \
  my_app \
  jekyll serve
```

Rather than chaining two commands at the end using `&&`, rather use two `docker run` commands such as one for your NPM install and one for `jekyll serve` which handles gems for you.
