---
title: Repo metadata
description: Display info about the current site's repo and author
---


{% raw %}

## Multiple fields

A metadata snippet to use on your site to describe the site metadata and how to get involved.

This can be used an includes file and used anywhere on your site - as long it is a markdown file and not an HTML layout.

```liquid
{% include metadata.md %}
```

This assumes `site.baseurl` is like `/repo-name`, to avoid storing repo name separately. This won't work for Netlify projects though where baseurl is not set. Consider using the GitHub Metadata plugin, which is lighter than GitHub Pages plugin.

A variable can also be set at the start as `github_url` using `capture` or another string approach.

See a snippet in use in my Fractal theme:

- [_includes/metadata.md](https://github.com/MichaelCurrin/fractal/blob/master/_includes/metadata.md)

### Without a plugin

This uses local data, without requesting GitHub API. Note that "NWO" is name with owner. e.g. `MyUsername/my-repo-name`.

```liquid
{% assign repo_nwo = site.github_username | append: site.baseurl %}

- Repo: [{{ repo_nwo }} ![Repo stars](https://img.shields.io/github/stars/{{ repo_nwo}}?style=social)](https://github.com/{{ repo_nwo }})
- Author: [{{ site.github_username }}](https://github.com/{{ repo_nwo }})
- Documentation: [GitHub docs](https://github.com/{{ repo_nwo }}/tree/master/docs/)
- Contribute: [GitHub contributing doc](https://github.com/{{ repo_nwo }}/blob/master/CONTRIBUTING.md)
```

Be sure to set the config as:

```yaml
github_username: MyUsername
```

You do not have to set your repo name in the config. Jekyll will find the repo name (from the `git remote` set up when you cloned or pushed the repo) and make that available as `site.baseurl`, always with a leading forward slash.

e.g. `/code-cookbook`

This property is normally used for serving a site on a subpath on GH Pages, but it works well as repo name.

### Using GH Metadata plugin

This uses the `site.github` field, which is populated with data fetched from GitHub API.

```liquid
- Repo: [{{ site.github.repository_nwo }} ![Repo stars](https://img.shields.io/github/stars/{{ site.github.repository_nwo }}?style=social)]({{ site.repository_url }})
- Author: [{{ site.github.owner_name }}]({{ site.github.owner_url }})
- Documentation: [Docs directory]({{ site.github.repository_url }}/tree/master/docs/)
- Contribute: [Contributing doc]({{ site.github.repository_url }}/blob/master/CONTRIBUTING.md)
```

This requires setting up a plugin as:

```ruby
group :jekyll_plugins do
  gem 'jekyll-github-metadata'
end
```


## Fork

A fork to take the user to a page where the repo can be forked.

```liquid
[Fork this repo]({{ site.github.repository_url }}/fork)
```

e.g. `https://github.com/MichaelCurrin/code-cookbook/fork`

Requires use of the GH Metadata plugin.

{% endraw %}
