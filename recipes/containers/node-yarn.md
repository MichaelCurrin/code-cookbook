---
title: Node and Yarn
description: Add Node or Yarn to a container
---


## Node image

Install Node image which apparently comes with Yarn already.
- `Dockerfile`
    ```docker
    FROM node:12
    ```

## Node from Deb source

Target Node version number.

- `Dockerfile` 
    ```docker
    FROM ubuntu
    
    RUN curl -sL "https://deb.nodesource.com/setup_12.x" | sudo -E bash -
    RUN npm install -g yarn
    ```

## Latest Node from APT

- `Dockerfile`
    ```docker
    FROM ubuntu
    
    RUN apt install nodejs
    RUN npm install -g yarn
    ```
   

## Yarn from APT

Set up a plain image then add Yarn to it using apt.

- `Dockerfile`
    ```docker
    FROM ubuntu

    ENV DEBIAN_FRONTEND=noninteractive

    RUN apt-get update

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
- Adding `apt-utils` is not necessarily, but prevents error when using `debconf`.
- There is already an `apt` packaged called `yarn`, so be sure to remove it.
- Install `gnupg` for `apt-key` to work.
