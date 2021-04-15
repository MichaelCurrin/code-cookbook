---
title: Documentation
description: Recipes for writing docs for your projects, as directories or docs sites
---


## Content

See the README and docs directory of the projects here.

- [py-project-template](https://github.com/MichaelCurrin/py-project-template) - for Python projects. In particular, see [README.template.md](https://github.com/MichaelCurrin/py-project-template/blob/master/README.template.md).
- [generic-project-template](https://github.com/MichaelCurrin/generic-project-template) - for any programming language.


## Docs site

Build a docs site to host on GitHub Pages, Netlify or other sites.

Here are a few of my projects which are relevant here, across different languages and frameworks.

- [gh-pages-no-jekyll](https://github.com/MichaelCurrin/gh-pages-no-jekyll)
    - The simplest approach. Write markdown or HTML pages and get a clean default theme for your site. No boilerplate like theme set up or configuration needed. So the focus is on content. This also makes it friendly for someone who is not a programmer but knows how to at least write markdown.
- [simplest-jekyll](https://github.com/MichaelCurrin/simplest-jekyll)
    - Choose another theme from the standard Jekyll themes, or select any theme using Remote Theme plugin. No CI needed. Just the standard GH Pages build.
- [mkdocs-quickstart](https://github.com/MichaelCurrin/mkdocs-quickstart)
    - > Started template for a MkDocs docs site on GH Pages - including CI
    - Use a Python-based docs site generator.
    - The build step for automated deploys is handled with a GH Actions.
- [docsify-js-template](https://github.com/MichaelCurrin/docsify-js-template)
    - > A quickstart template for a markdown-based docs site.
    - Uses DocsifyJS, a frontend-based JS library for docs sites.
    - Use a single HTML page, content in markdown pages and JS loaded on the frontend.
    - No build step or CI needed. A disadvantage is that this is a single-page app, so your site is not so visible to search engines, while static sites are.
- [vuepress-quickstart](https://github.com/MichaelCurrin/vuepress-quickstart)
    > Starter template for a VuePress project - including CI for GH Pages hosting
    - The template takes care of the boilerplate code, so you just have to worry about theming and content.
    - Uses VuePress, a Jamstack framework targeted at building static docs site using markdown.
    - VuePress used Vue internally, but you don't have to use Vue directly.
