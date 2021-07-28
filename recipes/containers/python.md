# Python

## No Dockerfile

Specify `python3.9` as the image and the command to run. Volume and working directory are set too.

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp \
    python:3.9 \
    python greet.py
```
