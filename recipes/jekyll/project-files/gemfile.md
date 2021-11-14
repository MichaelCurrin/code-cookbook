---
title: Gemfile
description: Sample content for the `Gemfile` file in a Jekyll project.
---


## Basic

Install Jekyll 3, Minima theme and a plugin:

```ruby
source "https://rubygems.org"

gem "jekyll", "~> 3.9"
gem "kramdown-parser-gfm", "~> 1.1"  # Required for Jekyll 3.9 (not 3.8 or 4)
gem "webrick", "~> 1.7"  # Ruby 3 support

gem "minima", "~> 2.0"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
end
```

For Jekyll 4, use one of these styles depending on how fixed you want to be. You can also omit `"kramdown-parser-gfm"`.

```ruby
gem "jekyll", "~> 4.0.1"
gem "jekyll", "~> 4.0"
gem "jekyll", "~> 4"
```


## Windows support

Install gems conditionally to support Windows timezone and watching. See related [discussion thread](https://github.com/jekyll/jekyll/issues/5935#issuecomment-284198548).

From `jekyll new`

- From Jekyll 4.2.
    ```ruby
    # Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
    # and associated library.
    platforms :mingw, :x64_mingw, :mswin, :jruby do
      gem "tzinfo", "~> 1.2"
      gem "tzinfo-data"
    end

    # Performance-booster for watching directories on Windows
    gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
    ```
- From Jekyll 3.9.1.
    ```ruby
    # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
    # and associated library.
    install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
      gem "tzinfo", "~> 1.2"
      gem "tzinfo-data"
    end

    # Performance-booster for watching directories on Windows
    gem "wdm", "~> 0.1.0", :install_if => Gem.win_platform?
    ```
- From Jekyll 3.8.
    ```ruby
    gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
    gem "wdm", "~> 0.1" if Gem.win_platform?
    ```

This snippet was copied from [Jekyll forums question](https://talk.jekyllrb.com/t/plugins-not-working/4846/4). It doesn't match the style of any of the above so I wouldn't use it.

```ruby
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo"
  gem "tzinfo-data"
end
```
