---
logo: github
description: How to use an action to build and deploy a site to GitHub Pages
---
# Deploy to GitHub Pages

This section gives you choices over a GitHub Action that will add an output dirctory to `gh-pages` so you can serve your site on GitHub Pages site.

These generic flows work for anything with an output directory, including:

- Static sites - using Jekyll (with custom gems), Hugo, Hexo, Gatsby, Next.js (Node.js), MkDocs (Python), etc.
- Single-Page Applications - anything in Node.js or Yarn that creates a build such as React or Vue.js

See [Tokens](/recipes/ci-cd/github-actions/tokens/) guide on use of tokens.

### Related

- [Build and deploy - Jekyll][] section.
- [GH Pages Deploy - Node][] page.
- [MkDocs][] section.

[Build and deploy - Jekyll]: {% link recipes/ci-cd/github-actions/workflows/jekyll/build/index.md %}
[GH Pages Deploy - Node]: {% link recipes/ci-cd/github-actions/workflows/node/gh-pages.md %}
[MkDocs]: {% link recipes/ci-cd/github-actions/workflows/mkdocs/index.md %}
