---
title: Home
layout: home
---

> {{ site.description }}

Welcome to **Code Cookbook**.

<div align="center" style="padding-bottom: 1em;">
    <a href="{{ site.baseurl }}{% link recipes/index.md %}">
        <img src="https://img.shields.io/badge/all_recipe_topics-blue?style=for-the-badge"
            alt="Go to recipes"/>
    </a>
</div>


## Featured topics

- [Make][]
    - Sample `Makefile` files.
- [CI/CD][]
    - Many language-specific sample [workflows][] for GH Actions to test and deploy your app
    - Plus some _Netlify_ configs.
- [SEO][]
    - Recipes for `robots.txt` and `sitemap.xml` files.
- [Shell][]
    - Usage help and examples for commands and patterns to use one or more commands to solve a real problem. Such as how to do find and replace using `find` or `sed` or how to clean up your git repo.
- [Jekyll][]
    - Code snippets and configs
- [Containers][]
    - Commands and configs for using Docker and Kubernetes.


[Make]: {{ site.baseurl }}{% link recipes/make/index.md %}
[CI/CD]: {{ site.baseurl }}{% link recipes/ci-cd/index.md %}
[Workflows]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/index.md %}
[SEO]: {{ site.baseurl }}{% link recipes/web/seo/index.md %}
[Shell]: {{ site.baseurl }}{% link recipes/shell/index.md %}
[Jekyll]: {{ site.baseurl }}{% link recipes/jekyll/index.md %}
[Containers]: {{ site.baseurl }}{% link recipes/containers/index.md %}
