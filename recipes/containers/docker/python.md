---
title: Python
logo: python
---


## Related

- [Python app](https://github.com/MichaelCurrin/docker-quickstarts/tree/master/examples/python_app) in my Docker quickstarts.


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

- Use of dot as `./` is needed.
- Packages are done first and then the rest of the app - this helps for caching of layers in image building.
- Packages are installed without using `pip` cache - this keeps the image size down.

Then run using Docker CLI or Docker Compose CLI.

Here as `make` commands to build the image with the name and `myapp` and then run it, deleting the container when it is done and not giving it a name.

```Makefile
container:
	docker build -t myapp .
	docker run --rm myapp
```


## CLI only

Here we use a Python image as a drop-in replacement for running the `python` command.

We specify `python3.9` as the image and **mount** the current directory (such as the repo root) inside the container. No need for a Dockerfile to copy files into the image.

This can be useful for trying out different versions of Python or testing your app in Linux on a Window or macOS host. You can edit files on the host and get the changes immediately in the container.

If you want to install any other dependencies in the container such as Node or Postgres, you are maybe better off setting up a `Dockerfile` and installing those in there. Or have a standalone container for database services.

### Basic

This will do nothing and then exit. 

It also has no access to your app or packages.

```sh
$ docker run --rm python:3.9
```

### Add volumes

Add the contents of your app to `/usr/src/myapp` and set that as your working directory.

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9
```

Load the contents of your virtual environment. This evaluates where `venv` is pointing to, so if it is a symlink then the symlink's target will be mounted.

The order matters - app the virtual env before your app.

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$(realpath venv):/usr/src/myapp" \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9
```

If you want `venv` to be recognized by Python, you need to add it your `PYTHONPATH` environment variable.

- `.env` - I keep this file around anyway because it helps VS Code work.
    ```sh
    PYTHONPATH=myapp:venv
    ```
    
Then load that inside the container. Here simplified without the 

```
docker run \
    # other flags here ...
    python:3.9 \
    bash -c 'source .env && python myapp/main.py'
```

You can test with `source .env && echo $PYTHONPATH` and see `myapp:venv` as output.

#### Testing

Here, we get the `venv` directory on the host to correspond to the default location for packages installed in a container.

So effectively these will the same and you can install on the host or the container.

- `venv/lib/python3.9/site-packages` on host.
- `/usr/local/lib/python3.9/site-packages` on container.

```
    -v "$(realpath venv)/lib:/usr/local/lib" 
```

I could not get this to work properly though. I installed `python-dev` so I could get an `.so` file for `pandas` but then `pip` was breaking. So in this case `Dockerfile` would have been better.

Also in general maybe it is safer to not be `root` and then to install for a target user, maybe in their user directory and not shared site-packages so they don't break.



### Interactive Python console

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9
```

### Run Python script

```sh
$ docker run --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    python greet.py
```

### Run a shell command

```sh
$ docker run --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    bash -c "cd scripts && python lib.py"
```
