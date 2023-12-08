---
description: Creating and maintaining a GitHub theme
---
# Themes

## Notes

See the docs for structure in general not just Jekyll - [What is a gem?](https://guides.rubygems.org/what-is-a-gem/).

See [Specification](https://ruby-doc.org/stdlib-2.7.0/libdoc/rubygems/rdoc/Gem/Specification.html) in Ruby docs.

### Gemspec

- The `*.gemspec` file is used to package the theme as gem.
- Required dependencies
    - Here are ways to add required dependencies.
        ```ruby
        spec.add_runtime_dependency 'example'
        spec.add_runtime_dependency 'example', '~> 1.1', '>= 1.1.4'

        spec.add_dependency 'example' # alias for add_runtime_dependency

        spec.add_development_dependency 'example'
        ```
    - When using the Remote Theme plugin, it will give an error if the listed depenedencies are missing and will **not** install them.
    - But if you add the theme to your site's `Gemfile`, then you can install the theme's dependencies and avoid the error. Even though the theme itself in local gems is not used due to Remote Theme plugin using the remote one on each build.
    - If you use explicity approach approach, then you can make your `Gemfile` lighter and let the theme control the gems.this works for a RubyGems theme like `gem 'minima'` or custom theme on GitHub like `gem 'minima', git: 'https://github.com/MichaelCurrin/minima'`.


### Gemfile

- A `Gemfile` is not needed in the theme. If it is included, it is only for testing the project and it is not passed to a downstream project.
- The `gemspec` command in the `Gemfile` will install dependencies from the `*.gemspec` file when running a Bundle install within the theme.


## Samples

### Quickstart

My own quickstart theme project.

[![MichaelCurrin - jekyll-theme-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=jekyll-theme-quickstart&color=142f89&logo=github)](https://github.com/MichaelCurrin/jekyll-theme-quickstart)

### Installed

Have a look at gemspec files for installed gems in your project:

```sh
$ ls vendor/bundle/ruby/2.7.0/specifications
```

### Minima

Pieces from the [Minima](https://github.com/jekyll/minima) theme, to help with build your theme.

- `Gemfile`
    ```ruby
    # frozen_string_literal: true

    source "https://rubygems.org"
    gemspec

    gem "jekyll", ENV["JEKYLL_VERSION"] if ENV["JEKYLL_VERSION"]
    gem "kramdown-parser-gfm" if ENV["JEKYLL_VERSION"] == "~> 3.9"
    ```
- `minima.gemspec`
    ```
    # frozen_string_literal: true

    Gem::Specification.new do |spec|
      spec.name     = "minima"
      spec.version  = "2.5.1"
      spec.authors  = ["Joel Glovier"]
      spec.email    = ["jglovier@github.com"]

      spec.summary  = "A beautiful, minimal theme for Jekyll."
      spec.homepage = "https://github.com/jekyll/minima"
      spec.license  = "MIT"

      spec.metadata["plugin_type"] = "theme"

      spec.files = `git ls-files -z`.split("\x0").select do |f|
        f.match(%r!^(assets|_(includes|layouts|sass)/|(LICENSE|README)((\.(txt|md|markdown)|$)))!i)
      end

      spec.add_runtime_dependency "jekyll", ">= 3.5", "< 5.0"
      spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
      spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"

      spec.add_development_dependency "bundler"
    end
    ```
