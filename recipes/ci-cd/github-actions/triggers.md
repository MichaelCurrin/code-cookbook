# Triggers cheatsheet

Options for the `on` field to trigger deploys.

Note that in general if you have test, lint and build steps, you probably want to run them on all pushes and PRs. If there is anything related to a deploy, you probably only want to run against the master branch. Also you will only want to run the deploy against `master` - if you run it against `master` and also `gh-pages`, you'll have issues.


## Resources

- [Workflow syntax for Github Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in Github docs. That also covers the ridiculous number of hours available for all your workflows so you can run them for all your projects.

## Trigger on a push or Pull Request event

### On push to any branch

```yaml
on: push
```

### On push or pull request to any branch

```yaml
on: [push, pull_request]
```

That's the same as:

```yaml
on:
  - push
  - pull_request
```
Or

```yaml
on:
  push:
  pull_request:
```

### On push to master or Pull Request to master

```yaml
on:
  push:
    branches: [master]
  pull_request:
    branches: [master]
```
Don't this won't run on a PR between two branches which aren't the `master` branch.

## On a schedule

Using [on.schedule](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions#onschedule) parameter.

Check syntax using [crontab.guru](https://crontab.guru/) site.

Example:

```yaml
on:
  schedule:
    - cron:  '0 0 * * *'
```

## Include or ignore

### Ignore a branch or tag

Note that if you use a rule from another section to include pushes to master and PRs to master, you won't have to ignore automated commits to `gh-pages`.

[docs](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#example-ignoring-branches-and-tags)

```yaml
on:
  push:
    branches-ignore:
      - foo
```

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


## On a tag or release

I haven't used release yet but it is popular from looking at other projects and I cover this in other recipes in the [workflows](workflows/) section.

```yaml
  release:
    types: [created]
```

```yaml
on:
  release:
    types: [published, created, edited]
```

Or tags.

```yaml
on:
  tags:
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

You might split out to two workflow files such as one with a push trigger and app testing job and another with a release trigger and page build job, as below.
To only build the site when creating a tag. This means you build less frequently but more _safely_ and deliberately from a tag. This is especially useful if there are multiple people working on your project and comitting merging to master.

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

    # Linting and unit tests.

    # Build the app or static site so any errors come up, but don't persist the result.
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

This assumes tag and release is done after a build.yml run but that might not be a good assumption. You might want to add some build and test steps from build.yml and duplicate them in deploy.yml (unfortunately they can't be reused across workflow files I think).

Whether using one or two files, you probably want your deploy job to _depend_ on another build job section in this the same workflow so they always run in series and a failed build will mean a deploy is skipped.
 
