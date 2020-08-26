# Rake for a Ruby project


## Samples

From [kramdown/parser-gfm](https://github.com/kramdown/parser-gfm/blob/master/Rakefile).

## Create file

```rake
CLOBBER << "VERSION"
file 'VERSION' do
  puts "Generating VERSION file"
  File.open('VERSION', 'w+') {|file| file.write(Kramdown::Parser::GFM::VERSION + "\n")}
end
```

```rake
task :gemfile do
  File.open('Gemfile', 'wb') do |f|
    f.puts <<~RUBY
      source 'https://rubygems.org'
      gemspec
      gem 'rake', '~> 13.0'
      gem 'minitest', '~> 5.0'
      gem 'rouge', '~> 3.0'
      gem 'rubocop', '~> 0.62.0'
    RUBY
  end
end
```
