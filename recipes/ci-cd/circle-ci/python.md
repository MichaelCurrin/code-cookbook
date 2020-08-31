# Python
> Using Python, Flask and Postgres

From [Project walkthrough](https://circleci.com/docs/2.0/project-walkthrough/) doc.

## Samples

### Install

Install Python packages.

```yaml
version: 2
jobs:
  build:
    docker:
      - image: circleci/python:3.6.2-stretch-browsers
    steps:
      - checkout
      - run: pip install -r requirements/dev.txt
```

### Services

Add a database - such as for running tests against a staging database.

```yaml
version: 2
jobs:
  build:
    docker:
      - image: circleci/python:3.6.2-stretch-browsers
        environment:
          FLASK_CONFIG: testing
          TEST_DATABASE_URL: postgresql://root@localhost/circle_test?sslmode=disable
      - image: circleci/postgres:9.6.5-alpine-ram
        environment:
          POSTGRES_USER: root
          POSTGRES_DB: circle_test
          POSTGRES_PASSWORD: ""
```


### Combine

Both of the previous sections combined.

```yaml
version: 2
jobs:
  build:
    docker:
      - image: circleci/python:3.6.2-stretch-browsers
        environment:
          FLASK_CONFIG: testing
          TEST_DATABASE_URL: postgresql://ubuntu@localhost/circle_test?sslmode=disable
      - image: circleci/postgres:9.6.5-alpine-ram
        environment:
          POSTGRES_USER: ubuntu
          POSTGRES_DB: circle_test
          POSTGRES_PASSWORD: ""
    steps:
      - checkout
      - run:
          name: Install Python deps in a venv
          command: |
            python3 -m venv venv
            . venv/bin/activate
            pip install -r requirements/dev.txt
```
