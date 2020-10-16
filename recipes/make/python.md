# Python


## Samples

### Install and check


See my [Makefile in py-project-template](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile), I have refined that over time to work well for me.


### Check types

For MyPy, see [Mypy - Add to project](../python/mypy/add-to-project.md) guide in this cookbook project. <!-- FIXME jekyll link -->


### Mypy and readthedocs 

From: [github.com/willmcgugan](https://github.com/willmcgugan/rich/)

- `Makefile` - I am interested in the Mypy lines here.
	```make
	test:
		pytest --cov-report term-missing --cov=rich tests/ -vv
		
	format:
		black --check rich
		
	typecheck:
		mypy -p rich --ignore-missing-imports --warn-unreachable
	typecheck-report:
		mypy -p rich --ignore-missing-imports --warn-unreachable --html-report mypy_report

	.PHONY: docs
	docs:
		cd docs && make html
	```
- `docs/Makefile` - build ReadTheDocs site with Sphinx.
	```make
	# Minimal makefile for Sphinx documentation
	#

	# You can set these variables from the command line, and also
	# from the environment for the first two.
	SPHINXOPTS    ?=
	SPHINXBUILD   ?= sphinx-build
	SOURCEDIR     = source
	BUILDDIR      = build

	# Put it first so that "make" without argument is like "make help".
	help:
		@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

	.PHONY: help Makefile

	# Catch-all target: route all unknown targets to Sphinx using the new
	# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
	%: Makefile
		@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	```


### Install, check and clean 

That does not deal with cleaning a project or handling a Python package install / clean flow. So for interest see also this project copied from [article](https://krzysztofzuraw.com/blog/2016/makefiles-in-python-projects.html)

The clean command is probably out of date for PY3 work.

For `find`:

> The plus sign at the end of the command is for `-exec command {}` which means that the total number of invocations of the command will be much less than the number of matched files.

- `Makefile`
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

Removing `.pyc` files might be different for pycache dir in newer PY3 or even the global dir.

Optionally add this at the top to prevent a file with that name from being executed of the `make` target.

```mk
.PHONY: clean-pyc clean-build
```


## Running with parameters

- `Makefile`
    ```make
    run:
        python manage.py runserver --host $(HOST) --port $(PORT)
    ```

Run:

```sh
$ make run HOST=127.0.0.1 PORT=8000
```


## Environment variables

Note here the virtual env directory is `.venv`.

```make
VIRTUALENV = python3 -m venv
SPHINX_BUILDDIR = docs/_build
VENV := $(shell realpath $${VIRTUAL_ENV-.venv})
PYTHON = $(VENV)/bin/python3

DEV_STAMP = $(VENV)/.dev_env_installed.stamp
DOC_STAMP = $(VENV)/.doc_env_installed.stamp
INSTALL_STAMP = $(VENV)/.install.stamp

TEMPDIR := $(shell mktemp -d)
ZOPFLIPNG := zopflipng
```

This allows things like this:

```make
virtualenv: $(PYTHON)
$(PYTHON):
	$(VIRTUALENV) $(VENV)
	
black: install-dev ## Run the tests
	$(VENV)/bin/black --target-version=py34 .

```

Though it is a lot easier if you only run `make` inside a virtual env locally (and not in a virtualenv on CI). Anyway there it is.

Temp directory is used for:

```make
foo:
	mkdir $(TEMPDIR)/zopfli
```


### Linting

#### Spellcheck

```make
# Run spellcheck on comments and docstring.
spell:  
	@pylint --disable all --enable spelling --spelling-dict en_US --spelling-private-dict-file spell.txt my_app
```
