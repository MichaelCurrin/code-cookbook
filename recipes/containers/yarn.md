---
description: Add Yarn to a container
---
# Yarn

Rather than using a Node or Yarn image, this takes a standard image and adds to it.

As an alternative, you can install Node and then use `npm i -g yarn`.

- `Dockerfile`
    ```Dockerfile
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
