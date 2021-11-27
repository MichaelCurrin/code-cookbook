# Breadcrumbs

Add breadcrumbs to your page.

- e.g. [Home]() / [Foo]() / [Bar]() / Baz

This was based on:

- [Breadcrumbs](https://jekyllcodex.org/without-plugin/breadcrumbs/#) on jekyllcodex.org

I cleaned it up and added supported for relative URLs.

- `_includes/breadcrumbs.html`
    ```html
    <div id="breadcrumbs">
    {% assign crumbs = page.url | remove: '/index.html' | split: '/' %}

        <a href="{{ '/' | relative_url }}">Home</a>

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

The code above _always_ starts with `Home`. This may not make sense for pages like `/about.html` and `/animals/index.html` which are 1 level below `/` in terms of URL but they are not really below `Home`. So the top level could be `Animals` instead and `Home` can be reached through the navbar.
