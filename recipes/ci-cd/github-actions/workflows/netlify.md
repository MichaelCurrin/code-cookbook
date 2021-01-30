---
title: Deploy to Netlify
description: Build your Netlify site on schedule using a request to a build hook
---

{% raw %}

## The problem case

A Netlify site will rebuild whenever you push commit to your main branches.

But what if your build process builds in external content such as from the GitHub API. Then you might want to build your site daily or weekly using an automated task, without you having to push a commit.

Netlify doesn't support scheduled builds, but you can use GH Actions to trigger a Netlify build.

We are going to use GH Actions on a schedule to trigger that build.


## How to setup

In Netlify, go to site preferences and create a build hook for a site. 

When you do a _POST_ request that URL, your site will build. If you want, you can test the snippet by running it locally and then checking your deploys in Netlify.

Copy the URL portion of the snippet you get.

Next you will want to keep your hook URL **private**. That will prevent strangers from triggering unnecessary rebuilds of your site. This privacy can be achieved by setting your URL as a secret environment variable which can be accessed within the workflow run.

In your GitHub repo's Settings, go to Secrets.

Create a variable with a name like `NETLIFY_HOOK_URL` and paste your copied value.

Create a workflow file on the Actions tab with content like this:

```yaml
name: Netlify build

on:
  schedule:
    - cron: "0 0 * * *"

jobs:
  build:
    name: Build

    runs-on: ubuntu-latest

    steps:
      - name: Request build hook
        run: curl -d '' {{ }}
```

Here we run daily at midnight in UTC time. Which is the same as GMT+00:00.

We turn the curl request into a _POST_ by supplying an empty data payload with `-d`.

Customize the schedule expression with [crontab.guru](https://crontab.guru)

{% endraw %}
