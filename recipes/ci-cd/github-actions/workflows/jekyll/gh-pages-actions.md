# GH Pages Actions
> Build a Jekyll site and publish to GH Pages using a single action

Here are some available actions in the marketplace.

I haven't tried all these out and there are a lot more in the marketplace, using different approaches and configurations. 

- [Jekyll 4 Build Deploy](https://github.com/marketplace/actions/jekyll-4-build-deploy)
- [Jekyll Actions](https://github.com/marketplace/actions/jekyll-actions) action
    - The downsides of this action are it does not work with `GITHUB_TOKEN` so is less secure and it uses Docker so can be slow (according to the README doc).
    - I have a demo which uses this action here [MichaelCurrin/jekyll-actions-quickstart](https://github.com/MichaelCurrin/jekyll-actions-quickstart)
- [Jekyll Action TS](https://github.com/limjh16/jekyll-action-ts)
    - This is fork of the one above. It uses TypeScript instead of Docker so should be quicker to download and handle non-default use-cases,
- [Jekyll Deploy GH Pages](https://github.com/marketplace/actions/jekyll-deploy-gh-pages)

