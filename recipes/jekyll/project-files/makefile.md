# Makefile

See Make directory in Cheatsheets and this repo.

See also:

https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/Makefile

## Samples

Be sure to use tab indentation.

The help command will include lines starting with text or with empty lines - so ignoring indented lines. Perhaps this could be ignore tabs instead, but then add logic for keeping indent comments if needed.

- Simple
    ```makefile
    default: install
    
    help:
      @egrep '^\S|^$$' Makefile

    install:
      bundle config --local path vendor/bundle
      bundle install

    upgrade:
      bundle update

    s serve:
      bundle exec jekyll serve --trace --livereload

    build-prod:
      JEKYLL_ENV=production bundle exec jekyll build
    ```
- Detailed
    ```makefile
    default: install
    
    help:
      @egrep '^\S|^$$' Makefile

    install:
      bundle config --local path vendor/bundle
      bundle install

    upgrade:
      bundle update

    s serve:
      bundle exec jekyll serve --trace --livereload
    r serve-root:
      bundle exec jekyll serve --trace --livereload --baseurl ''

    build-dev:
      bundle exec jekyll build

    build-prod:
      JEKYLL_ENV=production bundle exec jekyll build
    ```
    - `serve` will use subpath, as on Github Pages "Project" site.
    - `serve-root` will use root path, as on Github Pages "User" site or Netlify.
