---
title: Tokens cheatsheet
description: Instructions to set a GitHub token for CI builds
---

A GitHub Action needs permissions to push to your `gh-pages` branch - so you must provide a token.

Here are the approaches, from simplest to most complex to manage. A summary is provided.

- [GitHub token]({% link recipes/ci-cd/github-actions/tokens/github-token.md %})
	- API key scoped to a single repo.
	- Auto-generated for a GH workflow - low effort.
	- Very secure - you never have to copy or even view the value.
	- The main limitation is that this only works for GitHub Actions, unlike the others.
- [Access token]({% link recipes/ci-cd/github-actions/tokens/access-token.md %})
	- API key scoped to **all** repos in your GH account.
	- Easy to generate and add to a workflow.
	- **Warning** - this is the least secure. A token is for your entire profile, not per repo. With public repo access, a token gives read and write access to all your public repos - a compromised token can be used to do a lot of damage.
	- This key is useful for doing actions with the GH API such as reporting on stats.
- [Deploy key]({% link recipes/ci-cd/github-actions/tokens/deploy-key.md %})
	- API key scoped to a repo.
	- Needs to be generated **locally** once using SSH tool and your email address then pasted in so it takes more effort.
	- Slightly less secure then GH Token as you deal with a value, but this is more flexible.


Three tokens are supported by GitHub Actions.

| Token            | Private repo | Public repo | Protocol | Set up      |
| ---------------- | :----------: | :---------: | -------- | ----------- |
| `github_token`   |      ✅️       |      ✅️      | HTTPS    | Unnecessary |
| `deploy_key`     |      ✅️       |      ✅️      | SSH      | Necessary   |
| `personal_token` |      ✅️       |      ✅️      | HTTPS    | Necessary   |
