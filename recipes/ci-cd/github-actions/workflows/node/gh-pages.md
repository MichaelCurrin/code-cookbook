---
description: Deploy a GH Pages app using GH Actions and NPM/Yarn
---
# GitHub Pages deploy

{% raw %}

## About

This guide covers how to setup two things in one workflow:

1. Test and build your app using GH Actions. On any push or PR
2. Persist the results on the `gh-pages` branch (so they can served using GH Pages). But on a push to `master` only.

This flow is ideal for a Jekyll site. Or a React or Vue app, or any other app that can be built to a build directory and served as a static assets, without needing a Node.js server.


## Sample

The example below uses Yarn.

The `NODE_ENV` environment variable is set to `production` to ensure a production build is done. For example, in a Vue app you can setup the site to be on a subpath for GH Pages.

- `main.yml`
    ```yaml
    name: GH Pages Deploy

    on:
      push:
        branches: master
      pull_request:
        branches: master

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

This flow uses just **one** build job.

The job runs on a **push** to `master` and on a **PR** against `master`. Simply creating a feature branch will not trigger the build.

We want avoid actually deploying code on a PR and rather wait until code is merged to master. So we use a conditional statement to skip the deploy step for PR events.

```yaml
if: ${{ github.event_name != 'pull_request' }}
```

### Alternatives

- Having a build/test job and a deploy job separately would be nice, but it means you have to add extra code to persist build output across jobs.
- Having two workflow files could solve this - but then you have to duplicate and maintain install/test/build steps in both. And ideally prevent both flows from running - the build one then only needs to run not on a PR.


{% endraw %}
