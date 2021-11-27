# Basic

Some utilities to install, to make developing inside a container easier. Especially when running in interactive shell mode and you need to do something using familiar tools, without having to install in each container.

Choose between `curl` and `wget`, since they are similar and you don't need both..

Using `vim` or `nano` is good if you need to view or edit a file.

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

You can also use `build-essential` package to get:

- `make`
- `gcc`
- `g++`
