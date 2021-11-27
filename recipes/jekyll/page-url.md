# Page URL

{% raw %}

Get the page URL.

```liquid
page.url
```

```liquid
page.url | relative_url
```

Page URL as an array.

```liquid
page.url | remove: '/index.html' | split: '/'
```

e.g. `/foo/bar/index.html` becomes `['foo', 'bar']`.

Build up URL from that array.

```liquid
{{ site.baseurl }}{% for crumb in crumbs limit: crumb_limit %}{{ crumb | append: '/' }}{% endfor %}
```

These are used in the next section.


## Breadcrumbs

Here is an improved form of the includes file here:

- https://jekyllcodex.org/without-plugin/breadcrumbs/

Add it as `_includes/breadcrumbs.html` and call it as `{% include breadcrumbs.html %}`.

It will split the current path into pieces and then capitalized each and then join using a separator.

Using a `join` filter is not appropriate here because each item needs to have a lot of info to make it a link including build up the path for that piece of the crumb. There are two `for` loops here over the same array.

Examples (using pipe instead of forward slash, for readability):

- Current page: `/foo/bar/baz/index.md`
- Appearance: `Foo | Bar | Baz`
- Links `/foo | /foo/bar | /foo/bar/baz/html`

File:

- `_includes/breadcrumbs.html`
    ```html
    {% assign crumbs = page.url | remove: '/index.html' | split: '/' %}
    <div id="breadcrumbs">

    {% comment %} This works best in Jekyll 4 where baseurl is prepended already. {% endcomment %}
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

Here is an alternative form I've adapted for a project. The first two levels of the site (Home and categories listing) don't show breadcrumbs.

- `_includes/breadcrumbs.html`
    ```html
    {% assign crumbs = page.url | remove: '/index.html' | split: '/' %}

    {% if crumbs.size > 2 %}
        <div id="breadcrumbs">
        {% for crumb in crumbs offset: 1 %}
            {% unless forloop.first %}
                /
            {% endunless %}
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
    {% endif %}
    ```


## Homepage link note

Note in Jekyll 4 this includes base URL:

```
{% link index.md %}
```

But in Jekyll 3 you must do this:

```liquid
{{ site.baseurl }}{% link index.md %}
```

This can be used for most flexibility:

```liquid
{{ '/' | relative_url }}
```

Note that for the crumbs section that the `{{ site.baseurl }}` prefix should always be there. Note that `relative_url` is not practical since the URL is built through a `for` loop rather than a string.

{% endraw %}
