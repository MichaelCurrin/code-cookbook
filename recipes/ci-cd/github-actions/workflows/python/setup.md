# Setup
> How to setup one or more Python versions in your GH Actions environment


## Use a single Python version

Specify `3.x` for the latest version, or `3.8` for example to target a version.

- `build.yml`
    ```yaml
    name: Python package

    on: push

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - uses: actions/checkout@v2

        - name: Set up Python 3.x
          uses: actions/setup-python@v2
          with:
            python-version: '3.x'
    ```


## Use a matrix

- `build.yml`
    ```yaml
    name: Python package

    on: push

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
    ```

Alternately use just two versions:

```yaml
strategy:
  matrix:
    python-version: [3.6, 3.X]
```

You can test your matrix by printing the current Python version

```yaml
- name: Display Python version
  run: python -c "import sys; print(sys.version)"
```

Or simply `python -V`.
