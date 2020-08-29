# Workflows
> Samples, resources and instructions around run a GH Actions workflow

This section covers a variety of tools and flows including Python, NPM, Jekyll, GitHub Pages and mixing them together.

## Basics

- Start with [Basic](basic.md) if you are new to GH Actions.
- Continue to [Basic Node](node/basic.md) as that is still simple and will be useful for Node.js developers.
- To learn more about specific fields like `jobs` and the `on` trigger, go back to the [GithHub Actions](../) level.

## Building to GitHub Pages

- The [Deploy GH Pages](deploy-gh-pages) section will cover how to persist the output directory of your static site or Node app and then serve it as GH Page site. 
- You can also see the [Jekyll](jekyll/) section which also covers a Jekyll + GH Pages flow.

## Persist

For more info on how to **persist build artifacts** in general and not just for GH Pages, see the [Persisting workflow data using artifacts](https://docs.github.com/en/actions/configuring-and-managing-workflows/persisting-workflow-data-using-artifacts) section of GH docs.

That could be useful for example if you want to compile your project as a single and then add that as an attachment on a release.
