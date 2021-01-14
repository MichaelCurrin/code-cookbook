--
title: GiHub Token
description: A guide to using the secure `GITHUB_TOKEN` token in workflows
---


## About

- Generated **automatically** - GitHub creates this for you on an action run.
- You can use it in actions only.
- Setup the first deploy
    - You'll see the repo settings get setup as `gh-pages` branch but the site is not live. So you need to choose another option then switch back. Then you'll see the live URL and environment tab.
- Read it in an action:
     ```yaml
     ${{ secrets.GITHUB_TOKEN }}
     ````
- Docs
    - [Authenticating with the Github Token](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token)
        - > GitHub automatically creates a GITHUB_TOKEN secret to use in your workflow. You can use the GITHUB_TOKEN to authenticate in a workflow run.
        - Includes use in REST API request (such as for Jekyll build), which not straightforward to setup from what I read before.
        - See the [Permissions](https://help.github.com/en/actions/configuring-and-managing-workflows/authenticating-with-the-github_token#permissions-for-the-github_token) section.
