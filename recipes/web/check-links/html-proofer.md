# HTML proofer

How to use a Ruby gem as a CLI tool to validate links in your static HTML, for both internal and external links.

You can run this on any directory of static HTML files, locally or with CI.

For use in GitHub Actions, see my [HTML Proofer][] recipe in the GH Actions section.

[HTML Proofer]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/check-links/html-proofer.md %}


## Resources

- [Install gems and run][] - for setting up Ruby and gems on GH Actions.
- [gjtorikian/html-proofer][] gem on GitHUb.

[Install gems and run]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/ruby/install-gems-and-run.md %}
[gjtorikian/html-proofer]: https://github.com/gjtorikian/html-proofer


## Install

### Install gem globally

This is if you are going to reuse across your projects or are going to use in CI.

```sh
$ gem install html-proofer --user-install
```

### Install gem in project

This is for if you want to include in your project.

Use Bundler to add to your `Gemfile` and install it.

```sh
$ bundle add html-proofer --group "test"
```

Then later you can install it like this locally or in CI.

```sh
$ bundle install
```


## Usage

### 1. Build

Create your HTML output as usual.

e.g.

- Jekyll site.
    ```sh
    $ bundle exec jekyll build
    ```
- NPM app.
    ```sh
    $ npm run build
    ```

### 2. Run checks

Run the tool against your output directory, like `_site` or `build`.

#### Global level

If you installed globally, then run:

```sh
$ htmproofer _site
```

#### Project level

```sh
$ bundle exec htmlproofer _site
```

```
Running ["ScriptCheck", "LinkCheck", "ImageCheck"] on ["_site"] on *.html...


Checking 1022 external links...
```


## Write to log files

The output can get very long, so you might want to write to log files which are ignored.

The tool prints `stdout` as a count of URLs and files (a few lines only). The `stdout` content is the actually check breakdown, which can very long. Plus if you have any bad flags, you'll see help output and errors there.

Here, writing error output to `links.log`.

```sh
$ htmlproofer --assume-extension _site 2> links.log
```

## Usage

```sh
$ htmlproofer PATH [options]
```

If you omit the `PATH`, then it uses `.` for the current directory instead.

The docs recommend this:

```sh
$ htmlproofer _site
```

The output includes `_site` though.

Cleaner output and using `.` explicitly for clarity.

```sh
$ cd _site && htmlproofer .
```

You can also run against a file.

```sh
$ htmlproofer _site/index.html
```


## Configuration

See [Configuration][] in the docs.

[Configuration]: https://github.com/gjtorikian/html-proofer#configuration

See also output from:

```sh
$ htmlproofer --help
```

Some flag highlights are covered below.

### Log level

Set log level to debug.

e.g. `--log-level :debug`

Defaults to `:info` but you set `:debug`, `:info`, `:warn`, `:error`.

### HTTP status ignore

- `--http_status_ignore`
    > An array of numbers representing status codes to ignore.

Defaults to empty array.

e.g. `--http-status-ignore "999,401,404"`

### Only 4XX

Defaults to false.

- `--only-4xx`
    > Only reports errors for links that fall within the 4xx status code range.

### Force HTTPS

- `--enforce-https`
    > Fails a link if it's not marked as https.

### Assume extension

- `--assume-extension`
    > Automatically add extension (e.g. `.html`) to file paths, to allow extensionless URLs

The docs recommend this for Jekyll.

### External and internal links

Even if you use the `link` tag to enforce local links at build time, it is still useful for the tool to check external links. In case you there are some case where you didn't use `link`.

Check internal links only.

- `--disable-external`
    > If true, does not run the external link checker, which can take a lot of time.

Check external links only.

- `--external-only`
    > Only checks problems with external references.


## Rakefile setup

For a Jekyll site, the docs recommend the following for use with `rake` if you want go that route.

- `Rakefile`
    ```ruby
    require 'html-proofer'

    task :test do
      sh "bundle exec jekyll build"
      options = { :assume_extension => true }
      HTMLProofer.check_directory("_site", options).run
    end
    ```

Then run as:

```sh
$ rake test
```
