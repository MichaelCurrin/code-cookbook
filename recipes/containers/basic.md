# Basic

Some utilities to make using a container easier.

- `Dockerfile`.
    ```Dockerfile
    FROM ubuntu
    
    RUN apt install -q -y \
        apt-utils \
        curl \
        wget \
        make \
        vim \
        git
    ```
