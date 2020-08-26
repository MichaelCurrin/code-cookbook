# Rakefile basics
> Intro to using rake for Ruby projects

## Samples

Here is a sample based on the [blog post](https://www.rubyguides.com/2019/02/ruby-rake/) on the RubyGuides site.

- `Rakefile`
    ```rake
    desc "Print reminder about eating more fruit."

    task :apple do
      puts "Eat more apples!"
    end
    ```

And how to run it:

```sh
$ rake apple
# "Eat more apples!"
```

See the [Rakefile format](https://ruby.github.io/rake/doc/rakefile_rdoc.html) tutorial - it covers the syntax. Only minimal examples are shown below as these are too generic to be useful as is.

- `Rakefile`
    ```rake
    # Simple.
    task :name
      puts t
    end
    
    # With prerequisites.
    task name: [:prereq1, :prereq2] do |t|
      puts t
    end
    
    # With argugments.
    task :name, [:first_name, :last_name] do |t, args|
      puts "First name is #{args.first_name}"
      puts "Last  name is #{args.last_name}"
    end
    ```
    
