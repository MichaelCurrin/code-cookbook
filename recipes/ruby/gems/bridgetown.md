# Bridgetown

See [Bridgetown](https://michaelcurrin.github.io/dev-resources/resources/ruby/gems/bridgetown.html) resources.


## Set up a new Bridgetown project

Use the Bridgetown CLI to set up a new project, including sample content and dependencies.

The advantage of this is that you can skip installing Bridgetown in your global gems, but you still get use Bridgetown to create a basic project for you so you can get running quickly.

### Requirements

- Install Node and Yarn - see [instructions](https://gist.github.com/MichaelCurrin/bdc34c554fa3023ee81449eb77375fcb).
- Install Ruby and Bundler - see [instructions](https://gist.github.com/MichaelCurrin/fb758aea4d35e03b9ed093afddf4e7ec).

### Steps

Here's is what we'll do.

1. Set up an initial project with a Gemfile only
2. Configure Bundler to run the project scope without getting errors that you need root access.
3. Use that to install a Bridgetown at the project level.
4. Create a new Bridgetown project in the same directory (overwriting the temporary Gemfile).

Run these in your shell.

```sh
$ mkdir my-site
$ cd my-site

$ bundle config set --local path vendor/bundle

$ bundle init
$ bundle add bridgetown

$ bundle exec bridgetown new . --force
```

Start the dev server.

```sh
$ yarn start
```

To get an idea of the site you'll generate, see my [bridgetown-quickstart](https://github.com/MichaelCurrin/bridgetown-quickstart) repo.

