---
title: New project
description: How to create a fresh Jekyll project
---

## GitHub Pages light approach

1. Create a new empty repo.
1. Go to the _Settings_ of repo.
1. Go to the GitHub Pages section.
1. Choose your main branch and enable.
1. Choose a theme, using one of two approaches.
    - Use the GitHub UI - change theme on the current section of _Settings_. This will create a config  file and `README.md` file (warning: this will overwrite an existing `README.md`, which happened me).
    - Create a config file manually, then add theme as`theme: NAME` or `remote-theme: USER/NAME`.
1. Optionally create an `index.md` file.


## CLI

Whatever approach you use, pay attention to whether you have Jekyll 3 or 4.

### Use global

If you have Jekyll installed globally. 

```sh
$ jekyll new my-site
$ cd  my-site
```

### Use existing project

If you have Jekyll in an existing project, you can use that.

```sh
$ cd my-site-a
$ bundle exec jekyll new ~/repos/my-site-b
$ cd ~/repos/my-site-b
```

### Use project Jekyll from scratch

This does not require Jekyll globally or installed in any existing projects locally.

This flow sets up a Jekyll site with no content but just the sufficient gems, at the project scope in `vendor`.

Then that project-level Jekyll is used to make a new Jekyll scaffolded repo using the CLI, overwriting the content of the current directory, which are no longer needed.

See [gist](https://gist.github.com/MichaelCurrin/3e5e063a89196eca997cac34e7678c77).

<script src="https://gist.github.com/MichaelCurrin/3e5e063a89196eca997cac34e7678c77.js"></script>


## Use a template

### Jekyll 3 blog

1. Go to this repo:
    - [MichaelCurrin/jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo)
1. Click the _Use this template_ button to get a repo.
1. Follow the repo's docs to set up Jekyll locally and on GitHub Pages.

### Jekyll 4 and GitHub Actions

If you're interested in Jekyll 4 specifically.

1. Go to this repo:
    - [MichaelCurrin/jekyll-gh-actions-quickstart](https://github.com/MichaelCurrin/jekyll-gh-actions-quickstart)
1. Click the _Use this template_ button to get a repo.
1. Follow the repo's docs to set up Jekyll locally and on GitHub Pages. 
    - You just need to enable your site under GitHub Pages under _Settings_.
    - GitHub Actions will already be configured for you. You don't even have to set a token. 

### Jekyll 4 and Netlify

The above template also will work on Netlify. 

Delete the GitHub Actions workflow and set up a Netlify config - see this [Jekyll Netlify][] recipe.

[Jekyll Netlify]: {{ site.baseurl }}{% link recipes/ci-cd/netlify/configure/jekyll.md %}
