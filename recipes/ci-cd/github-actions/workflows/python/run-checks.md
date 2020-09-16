# Run checks

See also the flow in [PY Project Template workflow](https://github.com/MichaelCurrin/py-project-template/blob/master/.github/workflows/main.yml).

## Tests

Make sure to add `pytest` and `pytest-cov` to `dev-requirements.txt`.

```yaml
steps:
- name: Install dev dependencies
  run: pip install -r dev-requirements.txt

- name: Test with pytest
  run: |
    pytest tests.py --doctest-modules --junitxml=junit/test-results.xml \
      --cov=com --cov-report=xml --cov-report=html
```

## Lint

Add `flake8` to `dev-requirements.txt`.

```yaml
steps:
- name: Install dev dependencies
  run: pip install -r dev-requirements.txt

- name: Link with flake8
  run: flake8 .
```

Or more precisely:

```yaml
- name: Lint with flake8
  run: |
    # Stop the build if there are Python syntax errors or undefined names
    flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics

    # Exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
    flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```
