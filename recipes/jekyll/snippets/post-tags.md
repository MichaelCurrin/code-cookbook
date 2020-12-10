# Post tags

{% raw %}

In the repo this was taken from, there is a listing of all posts and there is a listing of all tags with posts shown under each tag.

Note that Jekyll doesn't generate a page for each category and post, but there is a PR in the works on the Jekyll repo to add that.


## Navigation

```html
<a href="{{ '/posts/' | relative_url }}">All Posts</a>
<a href="{{ '/tags/' | relative_url }}">All Tags</a>
```


## Tag names and counts

Untested. Based on a theme.

```html
{% for tag in site.tags %}
   {% assign name = tag[0] %}
   <div>
       <span class="term">{{ name }}</span>
       <span class="count">{{ site.tags[name].size }}</span>
   </div>
{% endfor %}
```


## Tags of a post

List matching tags on the footer of a post. The link is only useful if you have a page of all tags and content, since Jekyll does not make standalone pages for each tag.

Add this to your `_layouts/post.html` file.

```html
<span>
    {% for tag in page.tags %}
        <a href="{{ site.url }}/tags/#{{ tag }}" title="Pages tagged {{ tag }}" class="tag">
            <span class="term">
                {{ tag }}
            </span>
        </a>
    {% endfor %}
</span>
```

{% endraw %}
