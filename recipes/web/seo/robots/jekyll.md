# Jekyll

{% raw %}


## Basic

Based on [CloudCannon/aperture-jekyll-template robots.txt](https://github.com/CloudCannon/aperture-jekyll-template/blob/master/robots.txt).


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



## Plugin

See [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) plugin.

Install and enable under plugins and you'll get a sitemap and robots file.

- [robots.txt](https://github.com/jekyll/jekyll-sitemap/blob/master/lib/robots.txt)
    ```
    Sitemap: {{ "sitemap.xml" | absolute_url }}
    ```

{% endraw %}
