---
title: Access Token
description: A guide to the user-generated GitHub auth token for use in workflows
---


{% raw %}

## Warnings

### Security

- This is the **least** secure option - if the value is retrieved such as from your logs or by a malicious plugin or action, someone has access to read and write to _all_ your repos. Both in GH workflows and outside - such as doing a `curl` request on their machine to the GitHub API with your token in the URL or payload.
- Unfortunately, the documentation for many actions recommends this Access Token option.
- But, you can try swap this out in your workflow and use `GITHUB_TOKEN` instead and see if the Action supports it. Or read the README.md of the action to see what tokens it supports.
- Fortunately, GitHub does remove the token values from log output and restricts PRs of forks from using tokens.
    - Note from the Secrets settings tab of a repo:
        > Secrets are not passed to workflows that are triggered by a pull request from a fork. [Learn more](https://docs.github.com/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets).

### Generating

- You can regenerate a token at any time. This will invalidate any values for the same token which are in use and possibly compromised.
- Then you have to go and update all the secrets of repos that use that same token. Which is typically just in a repo's workflow secrets or a local `.env` file for GH API use.
- If you use the same token across many repos, you'll invalidate them all at once and will have to go and update the Secrets section on GH for each. To avoid this, you can create multiple secrets, each named after a repo. However, they will still all be _functionally the same_, each with access to write to _all_ your public repos and not just one repo.
- You can set an optional expiry time for the token such as 90 days. This makes it more secure but requires manually effort to regenerate and store the token when time is up.

## Scopes

See [Scopes for OAuth Apps](https://docs.github.com/en/developers/apps/scopes-for-oauth-apps) in the docs to see meanings forthe scope choices available.

> `public_repo` - Limits access to public repositories. That includes read/write access to code...


## Name of the token

This is known a "Personal Access Token" or "PAT" or "authentication token".

Depending on the workflow, the token should be named something like one of these:

- `ACCESS_TOKEN`
- `JEKYLL_PAT`

Note the `GITHUB_` is a reserved prefix in workflows, so custom token names cannot start with that.


## About

- Create manually this at the GitHub **account** level, then and use for one or more repos.
- Uses
    - Can be used in actions
    - For other cases such as manual or automated REST requests, if you put it in your URL or enter as your password. The PAT is actually _necessary_ if you use two-factor authenticator or single sign-on (otherwise you have to enter those a number on the command-line).
- Permissions are granted per token based on your choices.
- Read it in action with this, or whatever name the action uses:
    ```yaml
    ${{ secrets.ACCESS_TOKEN }}
    ```
- Docs - [Creating a Personal Access Token for the Command-line](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line)

_**Warning:** Treat your tokens like passwords and keep them secret. When working with the API, use tokens as environment variables instead of hardcoding them into your programs._

GitHub will also scan to find accidentally committed secrets - [doc](https://help.github.com/en/github/administering-a-repository/about-secret-scanning).


## How to use an access token in a workflow

### 1. Create token

1. Go to **Personal Access Tokens** section.
    - Shortcut URL: [github.com/settings/tokens](https://github.com/settings/tokens)
    - Navigation:
        1. Go to your GitHub profile.
        1. Go to **Developer Settings**
        1. Go to the **Personal Access Tokens** section.
1. **Create** a token - or use one you generated before.
    - Give it a name like "GitHub Actions"
    - Give it has permissions to `public_repos` (or the entire `repo` scope for private repository). Necessary for the action
   to commit to the `gh-pages` branch.
1. **Copy** the token value.

### 2. Set the token in secrets

1. Go to your repository's **Settings*
1. Go to **Secrets** tab.
1. **Create** a secret.
    - Use an appropriate name - see [Name of the token](#name-of-the-token).
    - Past the value copied in the section above.

### 3. Use the token in a workflow

Format:

```
${{ secrets.TOKEN_NAME }}
```

e.g.

Pass as an argument to an Action.

```yaml
with:
  ACCESS_TOKEN: ${{ secrets.ACCESS_TOKEN }}
```

Set as an environment variable on the workflow, job, or step scope.

```yaml
env:
  JEKYLL_PAT: ${{ secrets.JEKYLL_PAT }}
```

### 4. Run build

- Push to the repo, or
- Go to your action and click rerun.


## Using an access token directly

For cloning or pulling a private repo, or doing restricted actions such as push.

### Manual

Use token in place of a password.

```sh
$ git clone https://github.com/USERNAME/REPO_NAME.git
Username: <token>
Password:
```

### Automation

Use token as part of the URL.

```
https://<token>@github.com/USERNAME/REPO_NAME.git
```

Or

```
https://<token>:x-oauth-basic@github.com/USERNAME/REPO_NAME.git
```


### Notes

From [blog post](https://github.blog/2012-09-21-easier-builds-and-deployments-using-git-over-https-and-oauth/)

> Tokens should be treated as passwords. Putting the token in the clone URL will result in Git writing it to the .git/config file in plain text. Unfortunately, this happens for HTTP passwords, too.

{% endraw %}
