# Create an action

If you can't find an action on the Github Marketplace and you're not happy to write commands in the workflow steps, you can write you own action.


## Structure

Create a repo which has at least these files:

- `README.md`
- `entrypoint.sh`
- `Dockerfile`


## Contents

Example `Dockefile` contents:

```docker
FROM debian:9.5-slim

RUN apt update
RUN apt install -yq PACKAGE

LABEL "com.github.actions.name"="My name"
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
