# Collections

Iterate over items across collections.

{% raw %}

```html
{% for collection in site.collections %}
    {% unless collection.label == "posts" %}
        {{ collection.label }}

        <ul>
            {%- for c in collection.docs limit 3%}
                <li>
                    <a href="{{ c.url | relative_url }}">
                        {{ c.title }}
                    </a>
                </li>
            {% endfor -%}
        </ul>
    {% endunless %}
{% endfor %}
```

{% endraw %}
