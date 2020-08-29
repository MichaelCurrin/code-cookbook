# Basic

If you are a JS developer, see the [Basic Node](node/basic.md) section.


## Samples

### Hello world

This just demonstrates how to run a Hello World pipeline that will be run on every push to the repo (or a commit made in GH UI).

- `.github/workflows/main.yml`
    ```yaml
    name: CI

    on: push

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
          - uses: actions/checkout@v2

          - name: Greet
            run: echo Hello, world!
    ```

### Template

This one was copied from the base workflow created through the GitHub Actions UI. It is close to the one above but with more commans.

- `.github/workflows/main.yml`
    ```yaml
    # This is a basic workflow to help you get started with Actions

    name: CI

    # Controls when the action will run. Triggers the workflow on push or pull request
    # events but only for the master branch
    on:
      push:
        branches: [ master ]
      pull_request:
        branches: [ master ]

    # A workflow run is made up of one or more jobs that can run sequentially or in parallel
    jobs:
      # This workflow contains a single job called "build"
      build:
        # The type of runner that the job will run on
        runs-on: ubuntu-latest

        # Steps represent a sequence of tasks that will be executed as part of the job
        steps:
        # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
        - uses: actions/checkout@v2

        # Runs a single command using the runners shell
        - name: Run a one-line script
          run: echo Hello, world!

        # Runs a set of commands using the runners shell
        - name: Run a multi-line script
          run: |
            echo Add other actions to build,
            echo test, and deploy your project.
    ```

## Actions used

Uses [Checkout V2](https://github.com/actions/checkout) action - `actions/checkout`. A standard action for most workflows.
