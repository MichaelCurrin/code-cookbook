---
title: Jekyll
description: Sample `Makefile` files for Jekyll projects
---


### Basic

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

### Detailed

This is based on the [Makefile](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Makefile) in Jekyll Blog Demo project.

- `Makefile`
    ```make
    default: install

    all: install build


    h help:
        @grep '^[a-z]' Makefile


    install:
        bundle config set --local path vendor/bundle
        bundle install

    upgrade:
        bundle update


    s serve:
        bundle exec jekyll serve --trace --livereload

    build:
        JEKYLL_ENV=production bundle exec jekyll build --trace
    ```

#### Rake

See an equivalent Jekyll [Rakefile][] in the Ruby Rake recipes section.

[Rakefile]: {{ site.baseurl }}{% link recipes/ruby/rake/jekyll.md %}

#### Windows

See an equivalent Windows `make.bat` file below. This can presumably be run without `make` installed. 

This was generated using the [Make-to-Batch](https://github.com/espositoandrea/Make-to-Batch) tool using `Makefile` as an input. This has not been tested but is included for interest and comparison.

<details>
<summary>make.bat</summary>
    
```bat
@echo off

SET 	JEKYLL_ENV=production bundle exec jekyll build --trace

IF /I "%1"=="default" GOTO default
IF /I "%1"=="h help" GOTO h help
IF /I "%1"=="install" GOTO install
IF /I "%1"=="upgrade" GOTO upgrade
IF /I "%1"=="s serve" GOTO s serve
IF /I "%1"=="build" GOTO build
GOTO error

:default
	CALL make.bat install
	GOTO :EOF

:h help
	@grep '^[a-z]' Makefile
	GOTO :EOF

:install
	bundle config set --local path vendor/bundle
	bundle install
	GOTO :EOF

:upgrade
	bundle update
	GOTO :EOF

:s serve
	bundle exec jekyll serve --trace --livereload
	GOTO :EOF

:build
	JEKYLL_ENV=production bundle exec jekyll build --trace
	GOTO :EOF

:error
    IF "%1"=="" (
        ECHO make: *** No targets specified and no makefile found.  Stop.
    ) ELSE (
        ECHO make: *** No rule to make target '%1%'. Stop.
    )
    GOTO :EOF
```

</details>

### Container

Set up Jekyll to run in a container and use a `Makefile` to this easier to run. Those a Docker Compose file might be a more appropriate flow.

See [Jekyll]({{ site.baseurl }}{% link recipes/containers/jekyll.md %}) page in Containers section for more info.

- `Dockerfile`
    ```docker
    FROM jekyll/jekyll:4

    CMD ["jekyll", "--help"]
    ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
    ```

You can use your own code in the `Dockerfile`, but this is a starting point that matches the behavior from running without a `Dockerfile` as:

```sh
$ docker run --name blog \
  -p 4000:4000 \
  -it jekyll/jekyll:4 \
  jekyll serve --trace
```

When the image gets built, it will run `bundle install`. When you run a container each time, it uses that image and a volume mount for your repo.

We use `--rm` to delete the contain each time, otherwise you'll get an error that the container already exists with that name.

Here we use a `make` variable set with the Docker `run` command and arguments, so the command is easy to reuse.

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
