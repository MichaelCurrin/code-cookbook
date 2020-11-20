# Theme
> Creating and maintaining a GitHub theme



## Samples

### Quickstart

My own quickstart theme project.

[![MichaelCurrin - jekyll-theme-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=jekyll-theme-quickstart&color=blue&logo=github)](https://github.com/MichaelCurrin/jekyll-theme-quickstart)

### Minima

Pieces from the [Minima](https://github.com/jekyll/minima) theme, to help with build your theme.

As in Minima, you can add gems to your theme's `*.gemspec` file. That means you don't have to add them to your project's `Gemfile`.

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
