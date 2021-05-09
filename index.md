---
title: Home
layout: home
---

> {{ site.description }}

Welcome to **Code Cookbook**.

This aims to have entire recipe to solve a problem. Such as a script or config or a few files which work together. And the recipes are based on real world code as much as possible, sometimes collecting from repos or docs.

This handles more complexity than a cheatsheet, which is more about one line to solve a problem.

Often you can follow a reciple without changing much and you'll have something working. While a cheatsheet it more about syntax rules with some hello world example.

<div align="center" style="padding-bottom: 1em;">
    <a href="{{ site.baseurl }}{% link recipes/index.md %}">
        <img src="https://img.shields.io/badge/all_recipe_topics-blue?style=for-the-badge"
            alt="Go to recipes"/>
    </a>
</div>


## Quick access

I use these often so it helps to have them on the homepage.


- [Make][]
    - Sample `Makefile` files.
- [EditorConfig][]
    - Samples for a `.editorconfig` file.
- [Jekyll][]
    - Code snippets and configs.

## Featured

Highlights of this site.

- [CI/CD][]
    - Many language-specific sample [workflows][] for GH Actions to test and deploy your app
    - Plus some _Netlify_ configs.
- [SEO][]
    - Recipes for `robots.txt` and `sitemap.xml` files.
- [Shell][]
    - Usage help and examples for commands and patterns to use one or more commands to solve a real problem. Such as how to do find and replace using `find` or `sed` or how to clean up your git repo.
- [Containers][]
    - Commands and configs for using Docker and Kubernetes.


[EditorConfig]: {{ site.baseurl }}{% link recipes/other/editor-config.md %}
[Make]: {{ site.baseurl }}{% link recipes/make/index.md %}
[CI/CD]: {{ site.baseurl }}{% link recipes/ci-cd/index.md %}
[Workflows]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/index.md %}
[SEO]: {{ site.baseurl }}{% link recipes/web/seo/index.md %}
[Shell]: {{ site.baseurl }}{% link recipes/shell/index.md %}
[Jekyll]: {{ site.baseurl }}{% link recipes/jekyll/index.md %}
[Containers]: {{ site.baseurl }}{% link recipes/containers/index.md %}
