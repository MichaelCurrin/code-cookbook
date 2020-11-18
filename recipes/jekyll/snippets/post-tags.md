# Post tags

{% raw %}

List matching tags on the footer of a post.

Add this to your `_layouts/post.html` file.

```html
<span class="entry-tags">
    {% for tag in page.tags %}
        <a href="{{ site.url }}/tags/#{{ tag }}" title="Pages tagged {{ tag }}" class="tag">
            <span class="term">
                {{ tag }}
            </span>
        </a>
     {% endfor %}
</span>
```

