# Create an action

If you can't find an action on the GitHub Marketplace that meets your needs and you're not happy to write commands in the workflow steps, you can write you own action. This will be reusable for yourself and others across repos and so is a neat way to package your logic.

Note this page is not for beginners as it involves detailed knowledge about Actions and adding a public repo to be used in workflows. Before making an action, consider if an existing action or a multi-step workflow will solve your need.

There are Docker and JavaScript action types. This page focuses on the former.

## Structure

Create a repo which has at least these files:

- `README.md`
- `entrypoint.sh`
    - Shell script with your core logic. This could reference other TypeScript or Python scripts for example.
- `Dockerfile`
    - Setup dependencies for your action.


## Contents

Example `Dockefile` contents with placeholder values:

```docker
FROM debian:9.5-slim

RUN apt update
RUN apt install -yq PACKAGE

LABEL "com.github.actions.name"="My Name"
LABEL "com.github.actions.description"="My description"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.icon"="truck"

LABEL "repository"="http://github.com/USERNAME/REPO_NAME"
LABEL "homepage"="https://github.com/USERNAME/REPO_NAME"
LABEL "maintainer"="USERNAME <foo@bar.com>"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
```

The metadata might be more appropriate in `action.yml` as covered in the docs. See [Metadata syntax](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions).

You might want to add more packages or do some set up around folders and installing dependencies (like node packages or gems).


## Releasing

I am not familiar with how to get an action on the marketplace. Read this [doc](https://docs.github.com/en/actions/creating-actions/publishing-actions-in-github-marketplace).

But you can use _any_ action repo that is public (including your own) in a workflow, if it just exists on GitHub and is valid in its format

```yaml
steps:
    - uses: my-user/my-repo-action@v1
```

Repos are typically named with `-action` at the end.

Tagging using semvar convention helps ensure safety for using your action. See [Release management](https://docs.github.com/en/actions/creating-actions/about-actions#using-release-management-for-actions).
