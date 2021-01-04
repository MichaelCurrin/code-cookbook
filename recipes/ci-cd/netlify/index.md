---
layout: listing
logo: netlify
description: How to setup a Netlify site
---
# Netlify

I like using [netlify.com](https://netlify.com) to build and host many of my websites. If you aren't familiar, sign up for a free account and hook up one of your GitHub repos to deploy it.

It works well if you have a static site like made with Hugo or Jekyll, or a web app like React or Vue.

Netlify will build and serve your site for you on `my-app.netlify.app` - you can change the subdomain to anything not already taken.


## Setup a site

1. Create an account on Netlify.
2. Create a new site - select a repo GitHub (or BitBucket or GitLab).
3. Set your config options (see next section).
4. Rename the site domain.
5. Check the build log.
6. View your site URL.

Push changes to your repo to automatically trigger a build.


## Configs

See the [configure](configure.md) page for how to configure a Netlify build.


## Netlify vs GH Actions

Netlify is similar to using GH Actions to build and deploy to a `gh-pages` branch, but I find Netlify easier to configure. You need one line for a build command and it will take care of setting up your environment. 

With Ruby or Node and your gems and node modules (it will look for Gemfile and packages.json files).

You don't have to setup a GH Actions workflow file of steps or choose any actions or setup a token to actually push to a branch which serves on GH Pages.

You don't have to worry about tokens in Netlify either - GH Actions typically needs a token so it can commit to a branch for your and use that to serve a site.
