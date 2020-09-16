# Install dependencies

- `main.yml`
    ```yaml
    # ...

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

- `main.yml`
    ```yaml
    # ...

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
