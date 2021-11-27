# Makefile


## Related

- [Make][] recipes
- [Make](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/make/) section of Dev Cheatsheets project
- [Makefile](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Makefile) in my Jekyll template repo

[Make]: {% link recipes/make/index.md %}


## Samples

Be sure to use **tab** indentation.

The help command will include lines starting with text or with empty lines - so ignoring indented lines. Perhaps this could be ignore tabs instead, but then add logic for keeping indent comments if needed.

- Base.
    ```makefile
    default: install

    all: install build

    h help:
        @grep '^[a-z]' Makefile

    install:
        bundle config --local path vendor/bundle
        bundle install

    s serve:
        bundle exec jekyll serve --trace --livereload

    build:
        JEKYLL_ENV=production bundle exec jekyll build --trace
    ```
- Additions - note `serve` has an extra param so instead of serving on subpath, we serve on root for GitHub Pages "User" site or Netlify.
    ```makefile
    upgrade:
    	bundle update

    s serve:
    	bundle exec jekyll serve --trace --livereload --baseurl ''

    build-dev:
    	bundle exec jekyll build

    build-prod:
    	JEKYLL_ENV=production bundle exec jekyll build
    ```
