# Install dependencies

## Basic

- `main.yml`
    ```yaml
    steps:
      - uses: actions/checkout@v2

      - name: Setup Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.x'

      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt
    ```

## Cache

Cache dependencies for a faster build. Add this step to the config above, after _Setup Python_.

- `main.yml`
    ```yaml
    steps:
      - name: Cache pip
          uses: actions/cache@v2
          with:
            path: ~/.cache/pip
            key: ${{ runner.os }}-pip-${{ hashFiles('requirements.txt') }}
            restore-keys: |
              ${{ runner.os }}-pip-
              ${{ runner.os }}-
    ```

Notes:

- Path - the path used here is specific to Ubuntu so change it if using other OS runners.
- Key - look to see if there is a cache hit for the corresponding requirements file.
