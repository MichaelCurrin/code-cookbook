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

Specify `python3.9` as the image and the command to run. Volume and working directory are set too.

```sh
$ docker run -it --rm \
    --name my-python-app \
    -v "$PWD:/usr/src/myapp" \
    -w /usr/src/myapp \
    python:3.9 \
    python greet.py
```
