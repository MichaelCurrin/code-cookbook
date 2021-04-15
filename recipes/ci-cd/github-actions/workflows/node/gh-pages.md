---
title: GitHub Pages deploy
description: Deploy a GH Pages app using GH Actions and NPM/Yarn
---

{% raw %}


## About

This guide covers how to set up two things in one workflow:

1. Test and build your app. On any push or PR.
2. Persist the results on the `gh-pages` branch (so they can served using GH Pages). But on a push to `master` only.

This flow is ideal for a Jekyll site. Or a React or Vue app, or any other app that can be built to a build directory and served as a static assets, without needing a Node.js server.


## Sample

Here we build the app with Yarn (or you could use NPM instead) - note that Yarn and Node come standard in the environment. At the end, we commit the output directory to the `gh-pages` branch.

- `main.yml`
    ```yaml
    name: GH Pages deploy

    on:
      push:
        branches: main
        paths-ignore:
          - "**.md"

      pull_request:
        branches: main
        paths-ignore:
          - "**.md"

    jobs:
      build-deploy:
        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@master
            with:
              persist-credentials: false

          - name: Install 🔧
            run: yarn install

          - name: Lint 🧐
            run: yarn lint:check

          - name: Build 🏗️
            run: yarn build
            env:
              NODE_ENV: production

          - name: Deploy to GH Pages 🚀
            if: ${{ github.event_name != 'pull_request' }}
            uses: peaceiris/actions-gh-pages@v3
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: dist
    ```


## Notes

The `NODE_ENV` environment variable is set to `production` to ensure a production build is done. For example, in a Vue app you can set up the site to be on a subpath for GH Pages.

We want avoid actually deploying code on a PR and rather wait until code is merged to master. So we used a conditional statement to skip the deploy step for PR events.

```yaml
if: ${{ github.event_name != 'pull_request' }}
```

Or you could check if the event is a tag (or release), if you don't want to deploy without a tag.

If your project is a markdown-based app, then use this instead for triggers.

```yaml
on:
  push:
    branches: master
  pull_request:
    branches: master
```

To cover using specific versions of NPM or caching of packages, see the NPM and Yarn guides within my GH Actions section.


## Alternatives

Have a build/test job and a deploy job separately would be nice.

The downside of using two jobs is that you need extra code to save the build output from the one job and then open it in the second job. Because by default, nothing is persisted across jobs.

Or you have two workflow files. The one does just a build. And the deploy workflow does a build and deploy.

But then you have to duplicate and maintain install/test/build steps in both. And you probably want to be efficent and adjust your conditions to prevent both flows from running at once. The build one then only needs to run on a PR and the deploy one needs to run on master.

{% endraw %}
