# Hello world

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
