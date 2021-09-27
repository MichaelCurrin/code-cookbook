# Jekyll

Based on [CloudCannon/aperture-jekyll-template robots.txt](https://github.com/CloudCannon/aperture-jekyll-template/blob/master/robots.txt).

{% raw %}

- `robots.txt`
    ```liquid
    ---
    layout: null
    sitemap: false
    ---

    User-agent: *
    Disallow:

    Sitemap: {{ 'sitemap.xml' | absolute_url }}
    ```

{% endraw %}
