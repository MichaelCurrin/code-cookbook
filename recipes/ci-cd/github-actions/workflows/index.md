---
title: Workflows
description: Samples, resources and instructions around run a GH Actions workflow
---


The pages in this section covers a variety of tools and flows including Python, NPM, Jekyll, GitHub Pages and mixing them together. 

Here are some highlights.

### What can do with GitHub Actions?

Here are some popular things to do:

- Quality and security
    - Test for application for quality and security vulnerabities.
    - e.g. Use Python/Node/Ruby to run lint and unit steps your a main branch or a Pull Request.
    - e.g. Run [CodeQL][] scans on commits and on a schedule, using GitHub's [codeql-action][] action.
- Distribute
    - Build your Python/Node/Ruby/etc. application and on a tag or release on GitHub then package and publish the app to the appropriate packages registry.
    - Create a compiled binary or zip file and add it to a GitHub Release automatically.
- Build a static site
    - e.g. Use MkDocs, Jekyll 4 or Hugo to generate static HTML assets.
    - Serve your site on a built `gh-pages` branch using GitHub Pages.
    - Store your site output somewhere else such as to AWS S3.
- Build a web app
    - e.g. If you have single-page application in Node like using React or Vue, you can use the package's build command to output your static files.
    - Build content for use on GH Pages or another platform.
- Check links.
    - Run a link checker to find broken links on your site on a commit push or at intervals.
- Check site performance
    - Run Google Lighthouse checks on a schedule or on a Pull Request, to ensure your site remains performant and meets SEO standards.
- GitHub tasks
    - Perform admin actions on a PR like add a label or welcome a contributor or add a cat GIF.

[CodeQL]: https://securitylab.github.com/tools/codeql
[codeql-action]: https://github.com/github/codeql-action

### Basics

- Start with [Basic][] if you are new to GH Actions.
- Continue to [Basic Node][] as that is still simple and will be useful for Node.js developers.
- To learn more about specific fields like `jobs` and the `on` trigger, see my [GitHub Actions cheatsheets][].

[Basic]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/basic.md %}
[Basic Node]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/node/basic.md %}
[GitHub Actions cheatsheets]: https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/ci-cd/github-actions/

### Building and serving a site

- The [Deploy GH Pages](deploy-gh-pages) section covers how to build a static site (e.g. Jekyll or Hugo) or Node.js app (e.g. Vue or React) and then serve it as as GH Pages site.
- You can also see the [Jekyll](jekyll/) section which also covers a Jekyll 4 + GH Pages flow.
- The [MkDocs](mkdocs/) section is Python-based way of a building a docs site that can be hosted on GH Pages.

If you're building with Jekyll 3 on GitHub Pages are don't need custom plugins, then maybe you don't need the overhead of GH Actions and can use the plain GH Pages flow.

If you want to build a docs site without worrying about writing code or using GH Actions, use my [DocsifyJS Template][] project. It is just static assets (HTML and Markdown) and doesn't even need a `package.json` file or any processing.

[DocsifyJS Template]: https://michaelcurrin.github.io/docsify-js-template/#/

### Persist

For more info on how to **persist build artifacts** in general and not just for GH Pages, see the [Persisting workflow data using artifacts][] section of GH docs.

That could be useful for example if you want to compile your project as a single and then add that as an attachment on a release.

[Persisting workflow data using artifacts]: https://docs.github.com/en/actions/configuring-and-managing-workflows/persisting-workflow-data-using-artifacts
