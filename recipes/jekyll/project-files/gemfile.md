# Gemfile


## Basic

Install Jekyll 3, Minima theme and a plugin:

```ruby
source 'https://rubygems.org'

gem 'jekyll', '~> 3'
gem 'minima', '~> 2.0'

group :jekyll_plugins do
  gem 'jekyll-feed', '~> 0.6'
end
```

That Jekyll version will be less than `4.0.0`.

In the Gemfile, I previously used `'~> 3.8.5'` for Jekyll, but now `'~> 3.9.0'` is the latest.

For Jekyll 4, use one of these styles depending on how fixed you want to be.

```ruby
gem 'jekyll', '~> 4.0.1'
gem 'jekyll', '~> 4.0'
gem 'jekyll', '~> 4'
```


## Windows support

Install gems conditionally. See related [discussion thread](https://github.com/jekyll/jekyll/issues/5935#issuecomment-284198548).

```ruby
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo"
  gem "tzinfo-data"
end
```

This snippet was copied from [Jekyll forums question](https://talk.jekyllrb.com/t/plugins-not-working/4846/4).

