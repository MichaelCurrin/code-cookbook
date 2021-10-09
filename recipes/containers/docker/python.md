---
title: Python
logo: python
---


## With a Dockerfile

```Dockerfile
FROM python:3.9

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir 

COPY . .

CMD [ "python", "./app.py" ]
```

Notes:

- Us of `./` is needed.
- Packages are done first and then the rest of the app - this helps for caching of layers in image building.
- Packages are installed without using `pip` cache - this keeps the image size down.


## CLI only

Here we use a Python image as a drop-in replacement for running the `python` command.

We specify `python3.9` as the image and **mount** the current directory (such as the repo root) inside the container. Using volume (`-v`) and working directory (`-w`) flags. No need for a Dockerfile to copy files into the image.

This can be useful for trying out different versions of Python or testing your app in Linux on a Window or macOS host. You can edit files on the host and get the changes immediately in the container.

If you want to install any other dependencies in the container such as Node or Postgres, you are maybe better off setting up a `Dockerfile` and installing those in there. Or have a standalone container for database services.

### Run Python script

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    python greet.py
```

### Run a shell command

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    bash -c "cd scripts && python lib.py"
```
