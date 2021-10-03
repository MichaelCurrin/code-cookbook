# Read

{% raw %}

Get the details of your posts and add them to a Markdown page.

Such as your repo that is hosted on GitHub Pages or as your GitHub profile.

## Dev.to

Using action

- [gautamkrishnar/blog-post-workflow]https://github.com/gautamkrishnar/blog-post-workflow)

Contents of your README.md file:

```html
<!-- BLOG-POST-LIST:START -->
<!-- BLOG-POST-LIST:END -->
```

Workflow:

```yaml
name: Latest blog posts
on:
  workflow_dispatch:
  schedule:
    - cron: '0 0 * * *'

env:
  BLOG_USERNAME: MichaelCurrin

jobs:
  read-posts:
    name: Update this repo's README with latest blog posts
  
  runs-on: ubuntu-latest

    steps:
      - name: Checkout 
        uses: actions/checkout@v2
      - name: Read blog posts
        uses: gautamkrishnar/blog-post-workflow@master
        with:
          feed_list: https://dev.to/feed/${{ BLOG_USERNAME }}
          max_post_count: 3
```

You can use other sites too, using comma between URLs for multiple ones.

Hashnode:

- `https://${{ HASHNODE_USERNAME }}.hashnode.dev/rss.xml`

{% endraw %}
