# Python


## With a Dockerfile

```Dockerfile
FROM python:3.9

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt --no-cache-dir 

COPY . .

CMD [ "python", "./app.py" ]
```


## CLI only

Specify `python3.9` as the image and the command to run. No Dockerfile needed.

Note that volume (`-v`) and working directory (`-w`) are set too.

### Run script

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    python greet.py
```

### Run shell command

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    bash -c "cd scripts && python lib.py"
```
