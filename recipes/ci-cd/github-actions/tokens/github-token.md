---
title: GitHub Token
description: A guide to using the secure auto-generated `GITHUB_TOKEN` token in workflows
---

{% raw %}

## About

- Generated **automatically** - GitHub creates this for you on an action run.
- You can use it in actions only - not for API requests.
- Read it in an action:
     ```yaml
     ${{ secrets.GITHUB_TOKEN }}
     ```
- Docs
    - [Authenticating with the GitHub Token](https://docs.github.com/en/actions/reference/authentication-in-a-workflow)
        - > GitHub automatically creates a `GITHUB_TOKEN` secret to use in your workflow. You can use the GITHUB_TOKEN to authenticate in a workflow run.
        - Includes use in REST API request (such as for Jekyll build), which not straightforward to set up from what I read before.
        - See the [Permissions](https://docs.github.com/en/actions/reference/authentication-in-a-workflow#permissions-for-the-github_token) section.


## Use in workflow 

The token will be available on each workflow run.

Use `env` to set as environment variable.

e.g.

```yaml
steps:
  # ...

  - name: Deploy
    run: # ...
    env:
      GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

Or `with` to set as an argument to an Action. 

e.g. 

```yaml
steps:
  # ...

  - name: Deploy to GitHub Pages 🚀
    uses: peaceiris/actions-gh-pages@v3
    with:
      github_token: ${{ secrets.GITHUB_TOKEN }}
      publish_dir: public
```

{% endraw %}
