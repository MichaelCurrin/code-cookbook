---
description: How to install Python and Python packages on GH Actions
---
# Install dependencies

{% raw %}

## Samples

### Basic

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

### Cache

Store and retrieved cached dependencies for a faster build. Add this step to the config above, before the _Install dependencies_ step.

- `main.yml`
    ```yaml
    steps:
      - name: Cache dependencies
        uses: actions/cache@v2
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('docs/requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-pip-
            ${{ runner.os }}-
    ```

Notes:

- `path` - the path used here is specific to Ubuntu so change it if using other OS runners.
- `key` - look to see if there is a cache hit for the corresponding requirements file.
- Adjust the hashFiles input if your requirements file is at the root.

{% endraw %}
