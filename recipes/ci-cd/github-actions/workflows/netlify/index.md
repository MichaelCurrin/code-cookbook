---
title: Deploy to Netlify
logo: netlify
description: Build your Netlify site on schedule using a request to a build hook
---

{% raw %}

This guide was inspired by this [post](https://dev.to/chantastic/schedule-netlify-builds-with-github-actions-chron-and-webhooks-17n7).


## The problem case

A Netlify site will rebuild whenever you push commit to your main branches.

But what if your build process builds in external content such as from the GitHub API. Then you might want to build your site daily or weekly using an automated task, without you having to push a commit.

Netlify doesn't support scheduled builds, but you can use GH Actions to trigger a Netlify build.

We are going to use GH Actions on a schedule to trigger that build.


## How to setup

1. In Netlify, go to site preferences and create a build hook for a site. 
    - When you do a _POST_ request that URL, your site will build. 
   - If you want, you can test the snippet by running it locally and then checking your deploys in Netlify.
1. Copy the URL portion of the snippet you get.
    - Note you will want to keep your hook URL **private**. That will prevent strangers from triggering unnecessary rebuilds of your site. This privacy can be achieved by setting your URL as a secret environment variable which can be accessed within the workflow run. See the next step.
1. In your GitHub repo's Settings, go to Secrets.
1. Create a variable with a name like `NETLIFY_HOOK_URL` and paste your copied value.
1. Create a workflow file on the Actions tab with content as below.
1. Now wait for your workflow to run. You'll see it logged on the Actions tab and in Netlify deploys.


## Sample workflow file

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
        run: curl -d '' {{ secrets.NETLIFY_HOOK_URL }}
```

### Notes

- Here we run daily at midnight in UTC time. Which is the same as GMT+00:00.
- We turn the curl request into a _POST_ by supplying an empty data payload with `-d`.
- Customize the schedule expression with [crontab.guru](https://crontab.guru).

{% endraw %}
