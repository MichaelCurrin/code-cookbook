# Workflows
> Samples, resources and instructions around run a GH Actions workflow

This section covers a variety of tools and flows including Python, NPM, Jekyll, GitHub Pages and mixing them together. Here are some highlights:

## Basics

- Start with [Basic](basic.md) if you are new to GH Actions.
- Continue to [Basic Node](node/basic.md) as that is still simple and will be useful for Node.js developers.
- To learn more about specific fields like `jobs` and the `on` trigger, go back to the [GithHub Actions](../) level.

## Building and serving a site

- The [Deploy GH Pages](deploy-gh-pages) section covers how to build a static site (e.g. Jekyll or Hugo) or Node.js app (e.g. Vue or React) and then serve it as as GH Pages site.
- You can also see the [Jekyll](jekyll/) section which also covers a Jekyll 4 + GH Pages flow.
- The [MkDocs](mkdocs/) section is Python-based way of a building a docs site that can be hosted on GH Pages. 

If you're building with Jekyll 3 on GitHub Pages are don't need custom plugins, then maybe you don't need the overhead of GH Actions and can use the plain GH Pages flow.

If you want to build a docs site without worrying about writing code or using GH Actions, use this [Docsify.js Template](https://michaelcurrin.github.io/docsify-js-template/#/) project. It is just static assets (HTML and Markdown) and doesn't even need a `package.json` file or any processing.

## Persist

For more info on how to **persist build artifacts** in general and not just for GH Pages, see the [Persisting workflow data using artifacts](https://docs.github.com/en/actions/configuring-and-managing-workflows/persisting-workflow-data-using-artifacts) section of GH docs.

That could be useful for example if you want to compile your project as a single and then add that as an attachment on a release.
