# Create an action

If you can't find an action on the GitHub Marketplace and you're not happy to write commands in the workflow steps, you can write you own action.

Note this page is not for beginners as it involves detailed knowledge about Actions and adding a public repo to be used in workflows. Before making an action, consider if an existing action or a multi-step workflow will solve your need.


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

You might want to add more packages or do some setup around folders and installing dependencies (like node packages or gems).


## Pubishing

I am not familiar with how to get an action on the marketplace.

But you can use any action repo including your own in a workflow if it exists on GitHub.

