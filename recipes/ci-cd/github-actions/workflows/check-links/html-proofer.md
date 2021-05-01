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

