---
title: Deploy to Netlify
logo: netlify
description: Build your Netlify site on schedule using a request to a build hook
---

{% raw %}

This guide was inspired by this [post](https://dev.to/chantastic/schedule-netlify-builds-with-github-actions-chron-and-webhooks-17n7).

This leverages following areas:

- Scheduling of a GH Action
- GH secret environment variables
- Netlify build hooks - see [docs](https://docs.netlify.com/configure-builds/build-hooks/).


## The problem case

A Netlify site will rebuild whenever you push commit to your main branches.

But what if your build process builds in external content such as from the GitHub API. Then you might want to build your site daily or weekly using an automated task, without you having to push a commit.

Netlify doesn't support scheduled builds, but you can use GH Actions to trigger a Netlify build.

We are going to use GH Actions on a daily schedule to trigger that build.


## How to setup

1. In Netlify, go to site preferences and find an existing (secret) build hook URL for your site. 
    - A sample URL is like: `https://api.netlify.com/build_hooks/abcdef12345abcdef12345`
    - When you do a _POST_ request that URL without any data in the payload, your site will build. 
    - If you want, you can test the snippet by running it locally and then checking your deploys in Netlify.
1. Copy the ID portion of the snippet you get.
    - e.g. `abcdef12345abcdef12345`
    - Note you will want to keep this ID and hook URL **private**. That will prevent strangers from triggering unnecessary rebuilds of your site. This privacy can be achieved by setting your URL as a secret environment variable which can be accessed within the workflow run. See the next step.
1. Go to GitHub repo's _Settings_.
1. Then to _Secrets_.
1. Click _New repository secret_.
1. Create a secret with name `NETLIFY_HOOK_ID` and your copied ID as the value.
1. Create a new Actions workflow.
    - Go to _Actions_ tab of your repo and create a new workflow - at the top click _set up an workflow yourself_.
    - Or create a file file with path `.github/workflows/netlify.yml`.
1. Copy and paste the content from the workflow file below.
1. Now wait for your workflow to run at the specified time. You'll see it logged on the Actions tab and in your Netlify deploys.


## Workflow file

- `netlify.yml`
    ```yaml
    name: Scheduled Netlify deploy

    on:
      schedule:
        - cron: "0 0 * * *"

    jobs:
      deploy:
        name: Deploy

        runs-on: ubuntu-latest

        steps:
          - name: Request build hook
            run: curl -d '' https://api.netlify.com/build_hooks/{{ secrets.NETLIFY_HOOK_ID }}
    ```

### Notes

- Here we run daily at midnight. The time is in UTC time, which is within 0.9 seconds of _GMT +0 hours_ - [read more](https://greenwichmeantime.com/time-zone/gmt-plus-0/).
- If hover of the cron time when editing with Actions tab, GitHub will show you the frequency on hover.
- Customize the schedule expression with the help [crontab.guru](https://crontab.guru).
- We turn the curl request into a _POST_ by supplying an empty data payload with `-d`.

{% endraw %}
