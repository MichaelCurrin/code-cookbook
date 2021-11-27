# Git ignore file

- Simple - From [MichaelCurrin/jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo)
    ```
    .jekyll-cache/
    .sass-cache/
    .jekyll-metadata

    .bundle/
    vendor/

    _site/
    ```

Notes:

- `.jekyll-metadata` - File is added when running `jekyll new PATH` or serving in incremental mode.
- `.bundle/` - Stores the Bundler config. This can be different for local and prod/remote deploys when packages are frozen, so do not version. See the [Bundler install](https://bundler.io/man/bundle-install.1.html) docs about using `--deployment` and `--frozen` flags which probably change this.
