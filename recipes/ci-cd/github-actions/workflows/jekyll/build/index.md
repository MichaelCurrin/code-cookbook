---
title: Build and deploy
description: Build a Jekyll site with GH Actions and then publish as a GH Pages site
---

### Samples

In the examples in this section, there is a step to build the site with Jekyll and then a final step to serve the commit the `_site` directory to the `gh-pages` branch using an action. This keeps your source code on the main branch separate from the output site on the `gh-pages` branch.

After you have a workflow building successful, you can configure your repo's Settings to serve your `gh-pages` branch as a GitHub Pages site.

### Why use GitHub Actions for Jekyll?

Note that if you setup a Jekyll site on GitHub, such as with a config and a homepage, GitHub can build the site and serve it for you. No GitHub Actions needed. And only one branch is needed.

That approach without GitHub Actions is much simpler. The downside is that you are forced to use the plugins and Jekyll version setup by GitHub. And you can't mix in Node or Python or whatever in your build flow. With GitHub Actions, you get control of that. Plus better logging on failed builds.

### Related Cookbook sections

- [GH Pages Actions][] page in this Jekyll section.
- [Deploy GH Pages][] as a more generic section which could still be used for Jekyll.
- [Jekyll container][] page.

[GH Pages Actions]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/jekyll/gh-pages-actions.md %}
[Deploy GH Pages]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/deploy-gh-pages/index.md %}
[Jekyll container]: {{ site.baseurl }}{% link recipes/containers/jekyll.md %}

### Demo site

See my Jekyll GH Actions Quickstart template project which demonstrates how to build a minimal site. It has a GH Actions flow which sets up Jekyll and runs GH Pages deploy in the last step.

- [![MichaelCurrin - jekyll-gh-actions-quickstart](https://img.shields.io/static/v1?label=MichaelCurrin&message=jekyll-gh-actions-quickstart&color=blue&logo=github)](https://github.com/MichaelCurrin/jekyll-gh-actions-quickstart)
- [Live demo](https://michaelcurrin.github.io/jekyll-gh-actions-quickstart/) website.
