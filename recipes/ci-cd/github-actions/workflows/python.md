# Python

Using [setup-python](https://github.com/actions/setup-python) action.

Based on [Using Python with Github Actions](https://help.github.com/en/actions/language-and-framework-guides/using-python-with-github-actions) on GH docs.


## Usage

### Setup

### Use a single Python version

Specify `3.x` for latest version, or `3.8` for example to target a version.

```yaml
name: Python package

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    
    - name: Set up Python 3.x
      uses: actions/setup-python@v2
      with:
        python-version: '3.x' 
        
    # You can test your matrix by printing the current Python version
    - name: Display Python version
      run: python -c "import sys; print(sys.version)"
```

### Use a matrix

```yaml
name: Python package

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    
    strategy:
      matrix:
        max-parallel: 4
        python-version: [2.7, 3.5, 3.6, 3.7, 3.8]

    steps:
      - uses: actions/checkout@v2
      
      - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v2
        with:
          python-version: ${{ matrix.python-version }}
        
      # more steps...
```

Alternate strategy:

```yaml
strategy:
  matrix:
    python-version: [3.6, 3.X]
```


### Install dependencies

```yaml
steps:
- uses: actions/checkout@v2

- name: Set up Python
  uses: actions/setup-python@v2
  with:
    python-version: '3.x'
    
- name: Install dependencies
  run: |
    python -m pip install --upgrade pip
    pip install -r requirements.txt
```

Or, cache dependencies for a faster build.

```yaml
steps:
- uses: actions/checkout@v2

- name: Setup Python
  uses: actions/setup-python@v2
  with:
    python-version: '3.x'
    
- name: Cache pip
  uses: actions/cache@v2
  with:
    # This path is specific to Ubuntu
    path: ~/.cache/pip
    # Look to see if there is a cache hit for the corresponding requirements file
    key: ${{ runner.os }}-pip-${{ hashFiles('requirements.txt') }}
    restore-keys: |
      ${{ runner.os }}-pip-
      ${{ runner.os }}-
      
- name: Install dependencies
  run: pip install -r requirements.txt
```

### Run tests

Add `pytest` and `pytest-cov` to `dev-requirements.txt`.

```yaml
steps:
- name: Install dev depenedencies
  run: pip install -r dev-requirements.txt
  
- name: Test with pytest
  run: pytest tests.py --doctest-modules --junitxml=junit/test-results.xml --cov=com --cov-report=xml --cov-report=html
```

### Lint

Add `flake8` to `dev-requirements.txt`.

```yaml
steps:
- name: Install dev depenedencies
  run: pip install -r dev-requirements.txt
  
- name: Link with flake8
  run: flake8 .
```

Or more precisely:

```yaml
- name: Lint with flake8
  run: |
    # stop the build if there are Python syntax errors or undefined names
    flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
    # exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
    flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```

### Publish package

```yaml
name: Upload Python Package

on:
  release:
    types: [created]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: '3.x'
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install setuptools wheel twine
    - name: Build and publish
      env:
        TWINE_USERNAME: ${{ secrets.PYPI_USERNAME }}
        TWINE_PASSWORD: ${{ secrets.PYPI_PASSWORD }}
      run: |
        python setup.py sdist bdist_wheel
        twine upload dist/*
```
