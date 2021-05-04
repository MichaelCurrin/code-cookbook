---
title: Jekyll
description: Makefile samples for Jekyll
---


## Samples

See my `Makefile` in my Jekyll projects [Jekyll Blog Demo](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Makefile).

### Standard

- `Makefile`
	```make
	install:
		bundle config set --local path local vendor/bundle
		bundle install

	upgrade:
		bundle update

	s serve:
		bundle exec jekyll serve --trace --livereload
	```

### Container

See [Jekyll]({{ site.baseurl }}{% link recipes/containers/jekyll.md %}) page in Containers section for more info.

- `Dockerfile`
    ```Dockerfile
    FROM jekyll/jekyll:4

    CMD ["jekyll", "--help"]
    ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
    ```

You can use your own code in the Dockerfile, but this is a starting point that matches the behavior from running without a `Dockerfile` as

```sh
$ docker run --name blog \
  -p 4000:4000 \
  -it jekyll/jekyll:4 \
  jekyll serve --trace
```

When the image is built, it runs `bundle install`. When you run a container each time, it uses that image and a volume mount for your repo.

We use `--rm` to delete the contain each time, otherwise you'll get an error that the container already exists with that name.

Here we use a variable set with the Docker `run` command and arguments, making it easy reuse.

Note it could be more elegant to set port and volume in a `docker-compose.yml` file.

- `Makefile`
    ```make
    APP_NAME = my_app

    DOCKER_RUN = docker run --rm \
        -p 4000:4000 \
        --volume "$(PWD):/srv/jekyll" \
        $(APP_NAME)

    image:
        docker build --rm -t $(APP_NAME):latest .

    s serve:
    	$(DOCKER_RUN) jekyll serve --trace --livereload

    build:
        $(DOCKER_RUN) jekyll build --trace
    ```
