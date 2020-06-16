# Job cheatsheet
> Syntax for jobs in GH actions workflow file

See [Workflow syntax for Github Actions](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions) in Github docs.

> A workflow run is made up of one or more jobs. Jobs run in **parallel** by default.
>
> To run jobs sequentially, you can define dependencies on other jobs using the jobs.<job_id>.needs keyword.
>
> Each job runs in an environment specified by runs-on.


## Job IDs

Each job must have a unique ID as below.

```yaml
jobs:
  my_first_job:
    name: My first job
  my_second_job:
    name: My second job
```

Using `runs-on`.

```yaml
jobs:
  my_first_job:
    runs-on: ubuntu-latest
    name: My first job
  my_second_job:
    runs-on: ubuntu-latest
    name: My second job
```


## Needs

Setup a sequence of jobs. Here these run in a sequence, not parallel.

```yaml
jobs:
  job1:
  job2:
    needs: job1
  job3:
    needs: [job1, job2]
```

Using job output in a dependent job:

```yaml
jobs:
  job1:
    runs-on: ubuntu-latest
    
    # Map a step output to a job output
    outputs:
      output1: ${{ steps.step1.outputs.test }}
      output2: ${{ steps.step2.outputs.test }}
      
    steps:
    - id: step1
      run: echo "::set-output name=test::hello"
    - id: step2
      run: echo "::set-output name=test::world"
      
  job2:
    runs-on: ubuntu-latest
    needs: job1
    steps:
    - run: echo ${{needs.job1.outputs.output1}} ${{needs.job1.outputs.output2}}
```


## If statement

This step only runs when the event type is a pull_request and the event action is unassigned.

```yaml
steps:
 - name: My first step
   if: ${{ github.event_name == 'pull_request' && github.event.action == 'unassigned' }}
   run: echo This event is a pull request that had an assignee removed.
```

Read more [here](https://help.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions).


## Related

### Env

```yaml
env:
  SERVER: production
```

### Defaults

```yaml
defaults:
  foo: bar
```

```yaml
defaults:
  run:
    shell: bash
    working-directory: scripts
```
