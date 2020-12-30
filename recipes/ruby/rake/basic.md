---
description: Intro to using rake and Rakefile for Ruby projects
# TODO move to cheatsheets as this is just general syntax
---
# Basic

Rake is a Ruby task runner. You run the `rake` command with arguments and the tasks to run are defined in a `Rakefile` which has Ruby code in it.


## Samples

### Hello world

Based on the [blog post](https://www.rubyguides.com/2019/02/ruby-rake/) on the RubyGuides site.

- `Rakefile`
    ```rake
    desc "Print a greeting."
    task :greet do
      puts "Hello, world!"
    end
    ```

How to run it:

```sh
$ rake greet
```
```
"Hello, world!"
```

### Task types

See the [Rakefile format](https://ruby.github.io/rake/doc/rakefile_rdoc.html) tutorial - it covers the syntax. Only minimal examples are shown below as these are too generic to be useful as is.

- `Rakefile`
    ```rake
    # Simple.
    task :name
      puts 'Hello, world!'
    end

    # With arguments.
    task :name do |t, args|
      puts "Hello, #{args.name}!"
    end

    # With prerequisites.
    task name: [:prereq1, :prereq2] do |t|
      puts t
    end

    # Alt
    # task :name, [:first_name, :last_name] do |t, args|
    # ...
    ```

### Wikipedia

From the [Rake](https://en.m.wikipedia.org/wiki/Rake_(software)) page on Wikipedia.

Compile a Hello Worls program in C.

```ruby
file 'hello.o' => 'hello.c' do
  sh 'cc -c -o hello.o hello.c'
end

file 'hello' => 'hello.o' do
  sh 'cc -o hello hello.o'
end
```

Rules

```ruby
rule '.o' => '.c' do |t|
  sh "cc #{t.source} -c -o #{t.name}"
end
```
