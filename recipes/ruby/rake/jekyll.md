# Jekyll

Use `rake` to manage a static site project built with Jekyll.

See also [Make Jekyll][] recipe for an equivalent `Makefile` version of this `Rakefile`. Though `make` is not standard on Windows. While if you have Ruby, you probably have `rake` too, on any OS.

[Make Jekyll]: {% link recipes/make/jekyll.md %}


## Setup

- `Rakefile`
    ```ruby
    task default: %w[install]

    desc "Install and build"
    task :all => [:install, :build]


    desc "Install gems"
    task :install do
      sh "bundle config set --local path vendor/bundle"
      sh "bundle install"
    end

    desc "Upgrade gems"
    task :upgrade do
      sh "bundle update"
    end


    desc "Start dev server"
    task :serve do
      sh "bundle exec jekyll serve --trace --livereload"
    end
    task :s => :serve

    desc "Production build"
    task :build do
      sh "JEKYLL_ENV=production bundle exec jekyll build --trace"
    end
    ```


## Usage

### Show tasks

Note these will be sorted for you in the output.

```sh
$ rake --tasks
```
```
rake all      # Install and build
rake build    # Production build
rake install  # Install gems
rake serve    # Start dev server
rake upgrade  # Upgrade gems
```

### Run tasks

```sh
$ rake all
```

Omit a target to the default option, in this case `install`.

```sh
$ rake
```

Use an alias.

```sh
$ rake serve
$ # OR
$ rake s
```


## Notes

### Rake dependency

In your docs, you might want to list `rake` as a system dependency, like Ruby. This should hopefully be installed at the system or user level, but possibly an old version.

This can be installed globally with:

```sh
$ gem install rake  # --user-install
```

Or:

```sh
$ gem update --user-install
```

You could add `rake` to a `Gemfile` like this. Though you end up with a circular flow where you use `rake` to setup `Gemfile` to get `rake`. Also, I need to check - does `rake` run the local `rake` like with `bundle exec rake`. If not, then don't bother setting up `rake` in Gemfile.

```ruby
gem 'rake', '~> 13.0'
```

### Default

Both approaches give the same result.

- According to the [rake](https://github.com/ruby/rake) repo docs, a `default` task can be set as this. I don't know what that `%w` is about.
    ```ruby
    task default: %w[install]
    ```
- Following the style of other tasks in the `Rakefile` above, I arrived at this `default` task.
    ```ruby
    task :default => [:install]
    ```
