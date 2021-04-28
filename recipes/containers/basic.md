# Basic

Some utilities to make developing inside a container easier. Especially when running in interactive shell mode.

You probably need only one if curl and wget since they are similar.

Vim or nano are good if you need to view or edit a file.

Make is useful for Makefile commands.

Git is useful if you want to work with your git repo even just to check what has changed or see history.

- `Dockerfile`.
    ```docker
    FROM ubuntu
    
    RUN apt install -q -y \
        apt-utils \
        curl \
        wget \
        vim \
        nano \
        make \
        git
    ```
