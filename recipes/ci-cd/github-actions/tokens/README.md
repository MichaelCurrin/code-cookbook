# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github Action needs permissions to push to your `gh-pages` branch - so you must provide a token.

Here are the approaches, from simplest to most complex to manage. A summary is provided.

- [Github token](github-token.md)
	- API key scoped to a single repo.
	- Auto-generated for a GH workflow - low effort.
	- Very secure.
- [Access token](access-token.md)
	- API key scoped to **all** repos in your GH account.
	- Easy to generate and add to a workflow.
	- **Warning** - this is least secure and should never be exposed.
- [Deploy key](deploy-key.md)
	- API key scoped to a repo.
	- Needs to be generated locally using SSH tool and your email address then pasted in so takes more effort.
	- About as a secure as a Github Token, but the Deploy key is more flexible for advanced cases.


Three tokens are supported by Github Actions.

| Token            | Private repo | Public repo | Protocol | Setup       |
| ---------------- | :----------: | :---------: | -------- | ----------- |
| `github_token`   |      ✅️       |      ✅️      | HTTPS    | Unnecessary |
| `deploy_key`     |      ✅️       |      ✅️      | SSH      | Necessary   |
| `personal_token` |      ✅️       |      ✅️      | HTTPS    | Necessary   |
