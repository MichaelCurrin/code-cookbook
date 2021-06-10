---
title: Node and Yarn
description: Add Node or Yarn to a container
---

See also gists, not specific to Docker.

- [Install Node and NPM](https://gist.github.com/MichaelCurrin/aa1fc56419a355972b96bce23f3bccba) 
- [Install Yarn and Node](https://gist.github.com/MichaelCurrin/bdc34c554fa3023ee81449eb77375fcb)


## Use Node image

Use the [node](https://hub.docker.com/_/node/) image from Docker hub.

This includes Yarn already.

- `Dockerfile`
    ```docker
    FROM node:12
    ```


## Latest Node from APT

Use the [ubuntu](https://hub.docker.com/_/ubuntu) image from Docker hub.

APT already supports Node, but you'll only get a stable version which will behind the latest versions. See the next section to get a newer version of Node.

- `Dockerfile`
    ```docker
    FROM ubuntu
    
    RUN apt update
    RUN apt install -q -y nodejs
    
    RUN npm install -g yarn
    ```
   

## Node from Deb source

Similar to above, but instead of getting the Node version supported by APT (e.g. 10 or 12), you get a target version that you specify (like 14 or 16).

On the `curl` line, use `setup_14.x` or `setup_16.x` for example (using a literal letter `x`).

Based on [Installation instructions](https://github.com/nodesource/distributions/blob/master/README.md#installation-instructionsd) in the Node docs, which covers Ubuntu and Debian. The docs don't say that you need to run `update` after adding the souce.

- `Dockerfile` 
    ```docker
    FROM ubuntu
    
    RUN apt update
    RUN apt install -q -y curl
    
    RUN curl -sL "https://deb.nodesource.com/setup_14.x" | bash -
    RUN apt -q -y install nodejs
    
    RUN npm install -g yarn
    ```


## Yarn from APT

Set up a plain image then add Yarn to it using apt.

- `Dockerfile`
    ```docker
    FROM ubuntu

    ENV DEBIAN_FRONTEND=noninteractive

    RUN apt update

    RUN apt install -q -y \
        apt-utils \
        curl \
        gnupg

    RUN apt remove cmdtest && apt remove yarn
    RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
    RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    RUN apt install -q -y yarn
    ```

Notes:

- `DEBIAN_FRONTEND` is set to avoid the flow to set region for tzdata.
- It found I got errors consistently on `apt update` so switched to `apt-get update`.
- Adding `apt-utils` is not neeeded, but prevents error when using `debconf`.
- There is _already_ an `apt` packaged called `yarn` which is unrelated to JavaScript, so be sure to remove it.
- Install `gnupg` for `apt-key` to work on the `curl` line.
