---
title: Jekyll
logo: jekyll
description: How to run a Jekyll site in a container
---

Related recipe - [Jekyll in a container on GitHub Actions]({{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/jekyll/build/container.md %}).

{% raw %}


## Purpose

Running Jekyll and Bundler using a container executable is useful for development across operating systems and also means you don't have to worry about getting Ruby installed and setup. This makes it easier for other developers to use your project.

You can also use these commands in a CI flow if you want, which is actually where initially found one of the commands.


## Images

Here links to images on the Docker Hub website under the [jekyll](https://hub.docker.com/u/jekyll) user profile. The standard image will be used in the next sections but you can change it out.

- [jekyll/jekyll](https://hub.docker.com/r/jekyll/jekyll) image - standard.
    > The standard images (`jekyll/jekyll`) include a default set of "dev" packages, along with **Node.js**, and other stuff that makes Jekyll easy. It also includes a bunch of default gems that the community wishes us to maintain on the image.
- [jekyll/builder](https://hub.docker.com/r/jekyll/builder) image - includes tools.
    > The builder image comes with extra stuff that is not included in the standard image, like `lftp`, `openssh` and other extra packages meant to be used by people who are deploying their Jekyll builds to another server with a CI.
- [jekyll/minimal](https://hub.docker.com/r/jekyll/minimal) image - very minimal image.
    > The minimal image skips all the extra gems, all the extra dev dependencies and leaves a very small image to download. This is intended for people who do not need anything extra but Jekyll.

You can run `docker pull IMAGE_NAME` if you want to explicitly download or update the image names above. Though you don't have to. Use the Dockerfile or non-Dockerfile approaches below will download the tag for you if it is missing.


## Set Jekyll version

Set an environment variable on your host machine.

```sh
$ export JEKYLL_VERSION=4.2.0
```

The appropriate Jekyll image will be downloaded when running a command below - you don't have to download it explicitly.


## Run Jekyll container directly

Run the commands below on your **host** machine. Here we use a Docker image to make a container and pass commands to it, without using a Dockerfile. This is light approach.

The docker command is just long to write, you probably want to use an alias, `Makefile`, `docker-compose.yml` or similar to make that easier to call.

### Notes

- Steps are based on the Jekyll Docker repo's [docs](https://github.com/envygeeks/jekyll-docker#readme) and an article titled [Running Jekyll in Docker](https://ddewaele.github.io/running-jekyll-in-docker/).
- Using a `Dockerfile` file and docker compose (with volumes) might more convenient (less to type) than using the Jekyll container executable approach here. Maybe using `make` instead (though that is not standard on Windows). Note that `Dockerfile` is useful if you need to add Node.js to your container and you can still use volumes so you can edit code on the host. See the end of this guide.
- On this page below are low-level commands which means more to type (or paste) each time but they don't rely on any configs like `Dockerfile`, so are easy to experiment with.
- For using container steps in CI, see the [Jekyll on GH Actions][] recipes.
- The `--rm` flag will delete a container after it is run. Useful if you want to run the Jekyll container as an executable. Using volumes, the output will be persisted outside the container. But you should leave out the flag when you want to perist gems inside the container.
- We use the `volume` flag so that we can mount the project in the container as `/srv/jekyll`. Any operations in the container like gems in `vendor` and output in `_site` are persisted on the host.

[Jekyll on GH Actions]: ({{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/jekyll/build/index.md %})

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
Unable to find image 'jekyll/jekyll:4.2.0' locally
4.2.0: Pulling from jekyll/jekyll
...
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux-musl]
Running bundle install in /srv/jekyll...
...
```

As you can see from above, that container installs gems using Bundler, after setting up the Jekyll template files including `Gemfile`.

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

Tip - if your Jekyll version in `Gemfile` differs from the version of the image, then you should make them the same. If you want to use say Jekyll `4.3` in your Gemfile and the Docker image tag is not available, you could use `bundle exec jekyll build` as the command passed to the container. To ensure the project Jekyll gets used, instead of the container's global Jekyll.

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

The command above is from the docs, but I recommend adding `--rm` to remove the container and every time you run the command it will install gems. If you don't use `--rm`, you'll get an error on running the command again saying the name is in use and you need to remove or rename.

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


## Set up Jekyll with a Dockerfile
> How to use a Jekyll image in a Dockerfile

If you have more complex set up steps, then Jekyll through a container directly as above might be too limiting.

For example, you might want to install Postgres, Go or Python using `apt-get`, `apk` or `curl`. See a few samples below.

The `jekyll/builder` image already comes with Ruby, Bundle, Jekyll and even Node, so you don't have to install those. Below we use `jekyll/jekyll` and add Node to it.

### Node, Jekyll and SQLite (APK)

Here we do the following:

1. Use Node image (you could leave this out if you want).
1. Use Jekyll image.
1. Install SQLite using a package manager. (Replace with another `apk` package if you want).
    - Here we use `apk`, the Alpine Linux package manager. That is used within the [jekyll Dockerfile](https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/Dockerfile). See [tutorial](https://www.cyberciti.biz/faq/10-alpine-linux-apk-command-examples/).

```Dockerfile
FROM node:14
FROM jekyll/jekyll

RUN apk update
RUN apk add sqlite
```

### Node, SQLite (APT) and Jekyll

Here we do the following:

1. Use Node image.
1. Install SQLite using a package manager.
    - Here we `apt-get`.
    - Warning: If you do want to use `apt-get` with the Jekyll image, you must use the `apt-get` command _before_ `jekyll`, otherwise it will not be found. I don't know why - the Jekyll image seems to do something to remove use of `apt-get`.
1. Use Jekyll image.

```Dockerfile
FROM node:14

RUN apt-get update
RUN apt-get install -y \
  sqlite

FROM jekyll/jekyll
```

### Node (APT) and Jekyll

If you prefer to install Node with a package manager rather than an image. You might get an old version like v10. You'll need to add a registry if you want 12 or 14.

```Dockerfile
RUN apt-get update
RUN apt-get install -y \
  node.js

FROM jekyll/jekyll
```

### Entry point

When you use the Jekyll image in Dockerfile, you lose the entry point, so the container will do nothing.

Here we add the entrypoint, based on image's underlying Dockerfile.

```Dockerfile
FROM jekyll/jekyll:4.2.0

CMD ["jekyll", "--help"]
ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
```

See the [entrypoint](https://github.com/envygeeks/jekyll-docker/blob/master/repos/jekyll/copy/all/usr/jekyll/bin/entrypoint) script in the repo. It seems when I run the container, if you command starts with `jekyll` then it will run the `bundle install` steps for you but not if you do something else.

If you don't provide any arguments, the container will show the Jekyll command help.

### Build and run

Use the container built on a Dockerfile as set up above.

We use `rm` here to delete the container each time as we don't care about persisting any data in the container. And if you don't use the flag, then you'll end up creating a whole of lot of identical containers everytime you run `docker run` or `docker build`, which you'll have to cleanup later.

```sh
$ docker build --rm -t my_app:latest .
```

Then make a container from the image. Make sure to use `-v` or `--volume` as below, to persist build output outside the container, where you can use it.

Test Jekyll runs and displays help.

```sh
$ docker run --rm my_app
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux-musl]
jekyll 4.2.0 -- Jekyll is a blog-aware, static site generator in Ruby

Usage:

  jekyll <subcommand> [options]
...
```

Start a dev server:

```sh
$ docker run --rm \
  -p 4000:4000 \
  --volume "$PWD:/srv/jekyll" \
  my_app \
  jekyll serve --trace
```

Build site:

```sh
$ docker run --rm \
  -p 4000:4000 \
  --volume "$PWD:/srv/jekyll" \
  my_app \
  jekyll build --trace
```

Rather than chaining two commands at the end using `&&`, rather use two `docker run` commands such as one for your NPM install and one for `jekyll serve` which handles gems for you.

To test the command works on a Jekyll site, you can leave out the config and just make a homepage.

- `index.md`
    ```liquid
    ---
    title: Homepage
    ---

    # {{ page.title }}

    Hello, world!
    ```
Then the result:

- `_site/index.html`
    ```html
    <h1 id="homepage">Homepage</h1>

    <p>Hello, world!</p>
    ```

{% endraw %}
