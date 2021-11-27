---
title: Netlify
logo: netlify
description: How to set up a Netlify site
---

I like using [netlify.com](https://netlify.com) to build and host many of my websites. If you aren't familiar, sign up for a free account and hook up one of your GitHub repos to deploy it.

It works well if you have a static site like made with Hugo or Jekyll, or a web app like React or Vue.

Netlify will build and serve your site for you on `my-app.netlify.app` - you can change the subdomain to anything not already taken.


### Related

- [Netlify](https://michaelcurrin.github.io/dev-resources/resources/ci-cd/netlify/) under Dev Resources.


## Set up a site

1. Create an account on Netlify.
2. Create a new site - select a repo GitHub (or BitBucket or GitLab).
3. Set your config options (see next section).
4. Rename the site domain.
5. Check the build log.
6. View your site URL.

Push changes to your repo to automatically trigger a build.


## Configs

See the [Configure][] section for how to configure a Netlify build.

[Configure]: {% link recipes/ci-cd/netlify/configure/index.md %}


## Netlify vs GH Actions

Netlify is similar to using GH Actions to build and deploy to a `gh-pages` branch, but I find Netlify easier to configure. You need one line for a build command and it will take care of setting up your environment.

With Ruby or Node and your gems and node modules (it will look for Gemfile and packages.json files).

You don't have to set up a GH Actions workflow file of steps or choose any actions.

With GH Actions, set up an auth token to actually push to a `gh-pages` branch for serving on GH Pages. Netlify doesn't need a token or even use a `gh-pages` branch as it stores the content for you. Note using a token makes Netlify more secure - you don't have to manage a token and worry about it getting shared accidentally.

By the way, GH Actions and Netlify both have security to prevent secrets like a token from getting printed in your deploy log, in case someone makes a malicious fork.
