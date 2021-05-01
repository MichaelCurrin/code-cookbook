# HTML proofer

This a Ruby-based solution for checking broken links.

You can run this on any directory of static HTML files and do it locally or in CI.

The example here is targeted at a Jekyll static site and is based on this [blog posts](https://clementbm.github.io/github%20action/jekyll/link%20checking/2020/05/31/automatically-validate-links-on-jekyll-website.html).


## Resources

- [Install gems and run][] - for setting up Ruby and gems on GH Actions.
- [HTML proofer](https://github.com/gjtorikian/html-proofer) gem.

[Install gems and run]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/ruby/install-gems-and-run.md %}


## Install

### Global 

This is if you are going to reuse across your projects or are going to use in CI.

```sh
$ gem install html-proofer --user-install
```

Or

### Project install

This is for if you want to include in your project.

Add to Gemfile initially with:

```sh
$ bundle add html-proofer
```

Maybe under dev dependencies.

And install later locally or in CI as:

```sh
$ bundle install
```


## Run checks in the shell

```sh
$ bundle exec jekyll build
```

Drop the `bundle exec` bit if installed globally.

```sh
$ bundle exec htmlproofer _site
```

Set log level.

```sh
$ bundle exec htmlproofer --log-level :debug _site
```


## Workflow 

This example persists the checker log (stdout and stderr) as an uploaded file. This might make it easier to view rather than as a part of the long workflow log.

The article's recommended setting was continue on error so the check step doesn't stop the next from running. Or you can use a problem matcher to abort only on a fatal error.

```yaml
jobs:
  checklinks:
    name: Check links

    runs-on: ubuntu-latest

    strategy:
      fail-fast: false

  steps:
    - name: Checkout 🛎️
      uses: actions/checkout@v2

    - name: Set up Ruby 💎
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: '2.7'
        bundler-cache: true

      - name: Build 🏗
        run: bundle exec jekyll build

      - name: Check for broken links
        run: bundle exec htmlproofer --log-level :debug _site &> links.log
        continue-on-error: true
      
      - name: Archive checker log
        uses: actions/upload-artifact@v1
        with:
          name: links-check.log
          path: links.log
```
