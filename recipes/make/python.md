# Python and make


## Sample file

See [Makefile](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile) in my `py-project-template` repo as I have refined that over time to work well for me.

That does not deal with cleaning a project or handling a Python package install / clean flow.

So for interest see also this project copied from [article](https://krzysztofzuraw.com/blog/2016/makefiles-in-python-projects.html)

The clean command is probably out of date for PY3 work.

For `find`:

> The plus sign at the end of the command is for -exec command {} which means that the total number of invocations of the command will be much less than the number of matched files.

```make
TEST_PATH=./

clean-pyc:
    find . -name '*.pyc' -exec rm --force {} +
    find . -name '*.pyo' -exec rm --force {} +
    name '*~' -exec rm --force  {} 

clean-build:
    rm --force --recursive build/
    rm --force --recursive dist/
    rm --force --recursive *.egg-info

isort:
    sh -c "isort --skip-glob=.tox --recursive . "

lint:
    flake8 --exclude=.tox

test: clean-pyc
    py.test --verbose --color=yes $(TEST_PATH)

run:
    python manage.py runserver
```

Optionally add this at the top to prevent a file with that name from being executed of the `make` target.

```mk
.PHONY: clean-pyc clean-build
```

## Running with parameters

```mk
run:
    python manage.py runserver --host $(HOST) --port $(PORT)
```

Run:

```sh
$ make run HOST=127.0.0.1 PORT=8000
```

