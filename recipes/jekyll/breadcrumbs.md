# Breadcrumbs


This is an improved form of the file here:

- https://jekyllcodex.org/without-plugin/breadcrumbs/

```html
<div id="breadcrumbs">
{% assign crumbs = page.url | remove: '/index.html' | split: '/' %}

    {% comment %} This works best in Jekyll 4 where baseurl is prepended. {% endcomment %}
    <a href="{% link index.md %}">Home</a>

    {% for crumb in crumbs offset: 1 %}
        /
        {% if forloop.last %}
            {{ page.title }}
        {% else %}
            {% assign crumb_limit = forloop.index | plus: 1 %}
            <a href="{{ site.baseurl }}{% for crumb in crumbs limit: crumb_limit %}{{ crumb | append: '/' }}{% endfor %}">
                {{- crumb | replace: '-', ' ' | remove: '.html' | capitalize -}}
            </a>
        {% endif %}
    {% endfor %}

</div>
```


## Homepage link note

Note in Jekyll 4 this includes base URL:

```
{% link index.md %}
```

But in Jekyll 3 you must do this:

```
{{ site.baseurl }}{% link index.md %}
```

This can be used for most flexibility.

```
{{ '/' | relative_url }
```

Note that for the crumbs section that the `{{ site.baseurl }}` prefix should always be there. Note that `relative_url` is not practical since the URL is built through a `for` loop rather than a string.
