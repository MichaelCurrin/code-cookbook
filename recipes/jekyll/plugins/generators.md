---
description: How to generate output pages based on YAML data
---
# Generators

{% raw %}


## Samples

Based on [Generators](https://jekyllrb.com/docs/plugins/generators/) section of the Jekyll docs.

### Outline

> A generator is a subclass of `Jekyll::Generator` that defines a generate method, which receives an instance of Jekyll::Site. The return value of generate is ignored.

The `initialize` method is not needed, but it is covered here in case you need to override it.

- `_plugins/reading.rb`
    ```ruby
    module Foo
      class FuzzGenerator < Jekyll::Generator

        def initialize(site, foo)
          super
          # Your logic
        end

        def generate(site)
          # Your logic
        end
      end
    end
    ```

### Inject data

This reads data from `_data/books.yml` and assigns frontmatter values `ongoing` and `done` on a page.

- `_plugins/reading.rb`
    ```ruby
    module Reading
      class Generator < Jekyll::Generator

        def generate(site)
          book_data = site.data['books']
          ongoing = book_data.select { |book| book['status'] == 'ongoing' }
          done = book_data.select { |book| book['status'] == 'finished' }

          reading = site.pages.find { |page| page.name == 'reading.html'}

          reading.data['ongoing'] = ongoing
          reading.data['done'] = done
        end
      end
    end
    ```
    
### Create a page

This is inspired by the `jekyll-feed` plugin, which generates a `feed.xml` at your site root.

See [generator.rb](https://github.com/jekyll/jekyll-feed/blob/master/lib/jekyll-feed/generator.rb) code in the `jekyll-feed` repo.

Note use of `Jekyll::PageWithoutAFile`, since `my-file.html` does not yet exist. If you used `Jekyll::Page`, you would get a read error, as that is more suitable for reading a page like `about.md`.

```ruby
module SamplePlugin
  class MyPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      dir = '.'
      name = 'my-file.html'

      site.pages << Jekyll::PageWithoutAFile.new(site, site.source, dir, name).tap do |file|
        file.content = '<p>abcdef ghji</p>'
        file.data.merge!(
          "layout"     => nil,
          "sitemap"    => false,
        )
        file.output
      end
    end
  end
end
```

The layout here is `nil` but you can set the layout as the page layout for example. Then the content will be inserted in `{{ content }}` of the layout.

### Create pages from categories

Here we create a page for each category, as in the docs example. Note there is actually a PR to make that built into Jekyll.

This makes a `CategoryPage` class that is subclassed from `Jekyll::Page` (which points to a page that exists).

- `_plugins/sample-plugin.rb`
    ```ruby
    module SamplePlugin
      class CategoryPageGenerator < Jekyll::Generator
        safe true

        def generate(site)
          site.categories.each do |category, posts|
            site.pages << CategoryPage.new(site, category, posts)
          end
        end
      end

      class CategoryPage < Jekyll::Page
        def initialize(site, category, posts)
          @site = site             # the current site instance.
          @base = site.source      # path to the source directory.
          @dir  = category         # the directory the page will reside in.

          @basename = 'index'      
          @ext      = '.html'   
          @name     = 'index.html' 

          # Initialize data hash with a key pointing to all posts under current category.
          # This allows accessing the list in a template via `page.linked_docs`.
          @data = {
            'linked_docs' => posts
          }

          # Fallback to value set in config defaults if not set in data.
          data.default_proc = proc do |_, key|
            site.frontmatter_defaults.find(relative_path, :categories, key)
          end
        end

        def url_placeholders
          {
            :category   => @dir,
            :basename   => basename,
            :output_ext => output_ext,
          }
        end
      end
    end
    ```
- `_config.yml`
    ```yaml
    defaults:
      - scope:
          type: categories
        values:
          layout: category
          permalink: categories/:category/
    ```

### Data page generator

See [jekyll-datapage-generator.rb](https://github.com/avillafiorita/jekyll-datapage_gen/blob/master/lib/jekyll-datapage-generator.rb) of the `jekyll-datapage_gen` repo.

That plugin will generate files for values in a data file - e.g. `_data/my-file.yml`.

{% endraw %}
