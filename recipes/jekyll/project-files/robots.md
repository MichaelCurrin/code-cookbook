# Robots

{% raw %}

Based on `jekyll-sitemap` output.

```
---
User-agent: *
{% if jekyll.environment == 'production' %}
Sitemap: {{ site.url }}/sitemap.xml
Disallow:
{% else %}
Disallow: /
{% endif %}
```

{% endraw %}
