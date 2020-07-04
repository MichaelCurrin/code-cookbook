# Config
> Guide to `_config.md` file for Jekyll

Based on [MichaelCurrin/jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo/blob/master/_config.yml) but with fewer notes here.
    
## Site metadata

```yaml
### Site metadata ###

title: Title here
description: >-
  Text here
  
github_username: MichaelCurrin
```

Optionally set:

```yaml
email: your-email@example.com

markdown: kramdown
```

Some themes support social handles.

### Description note

If you leave the description blank and publish to Github Pages, it will take your Git
repo's description. At least the way the theme is setup.

```yaml
description: >-
  Write an awesome description for your new site here.
  And more here.  
```

If using minima, this will appear in your document head meta (for Google search results) and in your feed.xml site description.

Use `>-` to write multi-line content but to ignore newlines in the content.


## Build settings

```yaml
### Build settings ###

url: "https://michaelcurrin.github.io"
baseurl: "/code-cookbook"

theme: minima

plugins:
  - jekyll-feed
  - jekyll-sitemap

permalink: pretty
```

### URL notes

Your website will be served on: `{url}/{baseurl}`

- e.g. https://michaelcurrin.github.com/jekyll-blog-demo/

So set this up using the next two parameters - url and baseurl.

For URL, include **protocol** and **no** trailing forward slash.

- e.g. `"https://michaelcurrin.github.com"`.

This value is ignored usually - it only applied for a prod build, that is:

- When deploying to Github Pages.
- When wetting JEKYLL_ENV='production' as an environment variable locally or on Netlify.

It is recommended to set this at least for the canonical tag to be aware of the full domain,
as that is recommended but not required for use by crawlers.

```yaml
url: "https://michaelcurrin.github.io"
```

If using Github Pages as a project site (`USERNAME.github.io/my-project`),
this should be a forwardslash and the name of your repo - e.g. `"/my-project"`

Your site will be served from this URL so all URLs on the page should relative to this too.

If using a Github Pages as a user site (`USERNAME.github.io/`), or using Netlify, this can be empty.

```yaml
baseurl: "/jekyll-blog-demo"
```
    
## Include and exclude

### Include for processing

Jekyll will not process paths starting an underscore or dot, except of course
the underscore directories which it expects like `_posts`.
You can force inclusions here. For example, if you don't want to keep your
pages in the top-level directory.

```yaml
include:
- '_pages'
```

### Exclude from processing

We want to only copy to the `_site` directory the files and directories which we want to be served publically.

Jekyll will ignore files starting with a dot or underscore, but there are other files we
want to ignore. So set these below in your `exclude `field. The Makefile line can be
omitted if you do not have one. The slash is optional but helps indicate directories vs files.

```yaml
exclude:
  - LICENSE
  - README.md
  - Makefile

  # In Jekyll 4, these are always excluded, so you never have to add them to your list.
  # But in Jekyll 3, these are needed:
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor/
```

For more precise control over vendor, add these:

```yaml
- vendor/bundle/
- vendor/cache/
- vendor/gems/
- vendor/ruby/
```

Also add these if relevant for your project:

```yaml
- bin/
- docs/
```


## Analytics

```yaml
### Analytics ###

google_analytics: UA-87705880-3
```


## Content settings

```yaml
### Content settings ###

# Include posts, shows, etc. dated in the future.
future: true

# For readability of the repo, the top-level pages are their own directory and this allows
# them to be used.
include:
  - "_pages"

# Navigation bar items, in required order.
header_pages:
- "foo.md"
- "bar.md

collections:
  fizz:
    output: true
  buzz:
```

Set the layouts. Note that the Jekyll docs warn against globbing for performance reasons so these
have been made more explicit here for some.

```yaml
defaults:
- scope:
    path: "_fizz/*"
  values:
    layout: "fizz"
- scope:
    path: "_abc/*/index.md"
    type: "abc"
  values:
    layout: "abc"
- scope:
    path: ""
  values:
    layout: "default"
```
  
