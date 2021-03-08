# Metadata

{% raw %}

A metadata snippet to use on your site to describe the site metadata and how to get involved.

This can be used an includes file and used anywhere on your site - as long it is a markdown file and not an HTML layout.

```liquid
{% include metadata.md %}
```

This assumes `site.baseurl` is like `/repo-name`, to avoid storing repo name separately. This won't work for Netlify projects though where baseurl is not set. Consider using the GitHub Metadata plugin, which is lighter than GitHub Pages plugin.

A variable can also be set at the start as `github_url` using `capture` or another string approach.

- `metadata.md`
    ```liquid
    - Repo: [{{ site.repository_nwo }} ![Repo stars](https://img.shields.io/github/stars/{{ site.repository_nwo }}?style=social)]({{ site.repository_url }})
    - Author: [{{ site.owner_name }}]({{ site.owner_url }})
    - Documentation: [Docs directory on GitHub]({{ site.repository_url }}/tree/master/docs/)
    - Contribute: [Contributing doc]({{ site.repository_url }}/blob/master/CONTRIBUTING.md)
    ```
    
A fork to take the user to a page where the repo can be forked.

```liquid
[Fork this repo]({{ site.repository_url }}/fork)
```

e.g. `https://github.com/MichaelCurrin/code-cookbook/fork`

{% endraw %}
