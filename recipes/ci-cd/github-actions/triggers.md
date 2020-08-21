# Triggers cheatsheet

Options for the `on` field to trigger deploys.


## Resources

- [Workflow syntax for Github Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in Github docs. That also covers the ridiculous number of hours available for all your workflows so you can run them for all your projects.

## On push or Pull Request

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

### On push to master or Pull Request to any branch

```yaml
on:
  push:
    branches:
      - master

  pull_request:
```

### On push to master or Pull Request to master

This is more appropriate if you ever create a PR from one feature branch to another. Or from a feature branch to develop. And to treat that differently from a PR to master.

```yaml
on:
  push:
    branches:
      - master
            
  pull_request:
    branches:
      - master
```


## On a schedule

Using [on.schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule) parameter.

Check syntax using [crontab.guru](https://crontab.guru/) site.

Example:

```yaml
on:
  schedule:
    - cron:  '0 0 * * *'
```


## On a release

I haven't used release yet but it is popular from looking at other projects and I cover this in other recipes in the [workflows](workflows/) section.


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

## Ignore and include

### Ignore path

```yaml
on:
  push:
    paths-ignore:
    - 'docs/**'
```

### Include path

```yaml
on:
  push:
    paths:
    - '**.js'
```


## On page build

On a GH Pages build.

```yaml
on:
 page_build:
```

Note that even if you use GA to build your static site to the `gh-pages` branch, if GH Pages is enabled then GH will also do an additional build of that branch. But since it just contains assets and HTML and no Jekyll config, the build will be super simple. This flow of Jekyll doing two builds is seamless and so you won't even notice it but the point here is that the page build trigger can still be useful.


## Multiple triggers in one workflow 

Add multiple triggers. Here we run on push to master, PR to master and on a nightly cron job.

```yaml
on:
  push:
    branches:
      - master
      
  pull_request:
    branches:
      - master
  
  schedule:
    - cron:  '0 0 * * *'
```

Depending on how you set up the jobs section, you can have them depend on each other or run in parallel. 


You can add "checks" in your branch rules so that a PR can _only_ merge to master after all checks pass


## Multiple workflows


You might split out to two workflow files such as one with a push trigger and app test job and another with a release trigger and page build job (to only build the site when creating tag). Alternatively, you could run tests on pull requests but only pages build on merge to master. 


```yaml
# build.yml
on:
  push:
    branches:
      - master
      
  pull_request:
    branches:
      - master

jobs:
  build:
    # Installs

    # linting and unit tests.

    # build the app or static site so any errors come up, but don't persist the result.
```

```yaml
# deploy.yml

release:
    types:
      - created

jobs:
  deploy:
    # Build static site or docs site or publish to NPM etc.
```

This means you can make changes directly to master without tagging, for frequent deploys. 
