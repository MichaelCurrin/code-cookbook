# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github Action needs permissions to push to your `gh-pages` branch - so you must provide a token.

Here are the approaches, from simplest to most complex to manage, with summary notes.

- [Github token](github-token.md)
	- Repo-specific API key.
	- Auto-generated for a workflow - low effort.
	- Secure.
- [Access token](access-token.md)
	- Account-level API key.
	- Easy to generate and add to a workflow.
	- **Warning** - least secure.
- [Deploy key](deploy-key.md)
	- Repo-specific API key.
	- Needs to be generated locally using SSH tool and your email address then pasted in.
	- Secure.
