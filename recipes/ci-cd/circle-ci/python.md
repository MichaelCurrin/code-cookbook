---
description: Using Python, Flask and Postgres
---
# Python

From [Project walkthrough](https://circleci.com/docs/2.0/project-walkthrough/) doc.

I've added empty lines for easy reading.


## Samples

### Install

Install Python packages.

- `main.yml`
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

- `main.yml`
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

{% raw %}

- `main.yml`
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


### Full

The example flow continue including caching of packages and deploying to Heroku.

- `main.yml`
    ```yaml
    workflows:
      version: 2

      build-deploy:
        jobs:
          - build
          - deploy:
              requires:
                - build
              filters:
                branches:
                  only: master

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

          - restore_cache:
              key: deps1-{{ .Branch }}-{{ checksum "requirements/dev.txt" }}

          - run:
              name: Install Python deps in a venv
              command: |
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements/dev.txt

          - save_cache:
              key: deps1-{{ .Branch }}-{{ checksum "requirements/dev.txt" }}
              paths:
                - "venv"

          - run:
              command: |
                . venv/bin/activate
                python manage.py test

          - store_artifacts:
              path: test-reports/
              destination: tr1

          - store_test_results:
              path: test-reports/

      deploy:
        steps:
          - checkout

          - run:
              name: Deploy Master to Heroku
              command: |
                git push https://heroku:$HEROKU_API_KEY@git.heroku.com/$HEROKU_APP_NAME.git master
    ```

{% endraw %}
