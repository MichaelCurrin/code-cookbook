# API

See gist:

- [Jekyll - how to build a REST API](https://gist.github.com/MichaelCurrin/f8d908596276bdbb2044f04c352cb7c7)


{% raw %}

## Pages

```liquid
---
layout: none
---
[
  {%- for page in site.pages %}
    {
      "title":      {{- page.title | jsonify }},
      "url":        {{- page.url | jsonify }}
    }
    {% unless forloop.last %},{% endunless %}
  {% endfor -%}
]
```

## Posts

```liquid
---
layout: none
---
[
  {%- for post in site.posts %}
    {
      "id":         {{- post.id | jsonify -}},
      "title":      {{- post.title | jsonify }},
      "date":       {{- post.date | jsonify }},
      "url":        {{- post.url | jsonify }},
      "tags":       {{- post.tags | jsonify }},
      "categories": {{- post.categories | jsonify }}
    }
    {% unless forloop.last %},{% endunless %}
  {% endfor -%}
]
```


{% endraw %}
