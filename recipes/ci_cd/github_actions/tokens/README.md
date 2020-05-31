# Tokens cheatsheet
> Instructions to set a Github token for CI builds

A Github action needs permissions to push to your `gh-pages` branch.

Approaches, from simplest to most complex.

- [Github token](github-token.md)
	- Repo-specific API key
	- Auto-generated for a workflow
- [Access token](access-token.md)
	- Account-level API key.
	- Easy to generate and add to a workflow.
- [Deploy key](deploy-key.md)
	- Repo-specific API key.
	- Needs to be generated locally using SSH tool and your email address then pasted in.
