# Jekyll

Manage a static site project built with Jekyll.


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

In your docs, you might want to list `rake` as a system dependency, like Ruby.

You can add `rake` to a `Gemfile` like this. Though you would need an alternative to `rake` to install it, or perhaps the version only matters for some commands not specific to the installing.

```sh
gem 'rake', '~> 13.0'
```

### Default

Both approaches here work.

According to the [rake](https://github.com/ruby/rake) repo docs, default is setup as:

```sh
$ task default: %w[install]
```

While following the style of other tasks, I arrived at this:

```ruby
$ task :default => [:install]
```
