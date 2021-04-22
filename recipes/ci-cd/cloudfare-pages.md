---
title: CloudFare Pages
description: How to set up a CloudFare Pages static site
---

How to set up a website at the [pages.cloudflare.com](https://pages.cloudflare.com) homepage. Which is similar to a Netlify or GH Pages site.

See also my [CloudFare Pages resources](https://michaelcurrin.github.io/dev-resources/resources/ci-cd/cloudfare-pages/).

Follow the [Getting Started][] docs page for more detail than here.


## Steps

### Create account

Sign up for a free CloudFare account on [cloudflare.com](https://cloudflare.com)

### Configure site

Go to your CloudFare dashboard. Or click Sign Up from the [CloudFare Pages][] page.

Set up your site to deploy and host:

1. Choose your repo.
1. Enter your build config options. Use a preset or enter your own values.
    - e.g. from the _Create React App_ Framework preset:
        - `build command`: `npm run build`
        - `build output directory`: `build`
1. Click continue and wait for your site to build.
1. Find the deploy URL and visit your site.

I set up my `react-quickstart` repo and got a generated URL like this:

- `https://89019813.react-quickstart.pages.dev/`

### Set custom URL

Follow the [Getting Started][] page for want to add a custom URL, to serve your site under that a domain that you own.

[Getting Started]: https://developers.cloudflare.com/pages/getting-started
