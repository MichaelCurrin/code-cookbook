---
layout: listing
description: Instructions to set a Github token for CI builds
---
# Tokens cheatsheet

A Github Action needs permissions to push to your `gh-pages` branch - so you must provide a token.

Here are the approaches, from simplest to most complex to manage. A summary is provided.

- [Github token](github-token.md)
	- API key scoped to a single repo.
	- Auto-generated for a GH workflow - low effort.
	- Very secure as you never have to see the value.
	- The main limitation is that this only works in for Github Actions, unlike the others.
- [Access token](access-token.md)
	- API key scoped to **all** repos in your GH account.
	- Easy to generate and add to a workflow.
	- **Warning** - this is least secure and should never be exposed.
	- It can be set to read-only (not useful for deploys).
	- This key is useful for doing actions with the GH API such as reporting on stats.
- [Deploy key](deploy-key.md)
	- API key scoped to a repo.
	- Needs to be generated **locally** once using SSH tool and your email address then pasted in so it takes more effort.
	- Slightly less secure then GH Token as you deal with a value, but this is more flexible.


Three tokens are supported by Github Actions.

| Token            | Private repo | Public repo | Protocol | Setup       |
| ---------------- | :----------: | :---------: | -------- | ----------- |
| `github_token`   |      ✅️       |      ✅️      | HTTPS    | Unnecessary |
| `deploy_key`     |      ✅️       |      ✅️      | SSH      | Necessary   |
| `personal_token` |      ✅️       |      ✅️      | HTTPS    | Necessary   |
