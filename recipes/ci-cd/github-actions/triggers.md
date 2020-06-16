# Triggers cheatsheet

Options for the `on` field to trigger deploys.


## Resources

See [Workflow syntax for Github Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in Github docs.


## On push or pull request

### On push to any branch

```yaml
on: push
```

### On push or pull request to any branch

```yaml
on: [push, pull_request]
```

The same as:

```yaml
on:
  push:
  pull_request:
```

And maybe:

```yaml
on:
  - push:
  - pull_request:
```

### On push or master or Pull Request to any branch

```yaml
on:
  pull_request:
  push:
    branches:
      - master
```

### On push or Pull Request to master

```yaml
on:
  push:
    branches:
      - master
            
  pull_request:
    branches:
      - master
```


## On schedule

Using [on.schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule) parameter.

Check syntax using [crontab.guru](https://crontab.guru/) site.

Example:

```yaml
on:
  schedule:
    - cron:  '0 0 * * *'
```


## On a release

```yaml
on:
  release:
    # Only use the types keyword to narrow down the activity types that will trigger your workflow.
    types: [published, created, edited]
```

Or tags.

```yaml
on:
  tags:
```


## Ignore directory

```
on:
  push:
    paths-ignore:
    - 'docs/**'
```


## Multiple events

Add trigger of page build. The release one does not affect the page build one.

```yaml
on:
  push:
    branches:
      - master
      
  pull_request:
    branches:
      - master
      
  page_build:
  
  release:
    types:
      - created
```
