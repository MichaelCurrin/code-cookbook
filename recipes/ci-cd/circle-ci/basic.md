# Basic

## Samples

From [Digging Into Your First Pipeline](https://circleci.com/docs/2.0/getting-started/#digging-into-your-first-pipeline) in the docs.

### Single job

A Node.js job.

- `.circleci/config.yml`
    ```yaml
    version: 2.1
    
    orbs:
      node: circleci/node@1.1
      
    jobs:
      build:
        executor:
          name: node/default
          tag: '10.4'
          
        steps:
          - checkout
          - node/with-cache:
              steps:
                - run: npm install
          - run: npm run test
    ```
    
### Multiple jobs

A Ruby app.

- `.circleci/config.yml` 
    ```yaml
    version: 2
    
    jobs: # we now have TWO jobs, so that a workflow can coordinate them!
     one: # This is our first job.
       docker: # it uses the docker executor
         - image: circleci/ruby:2.4.1 # specifically, a docker image with ruby 2.4.1
       # Steps are a list of commands to run inside the docker container above.
       steps:
         - checkout # this pulls code down from GitHub
         - run: echo "A first hello" # This prints "A first hello" to stdout.
         - run: sleep 25 # a command telling the job to "sleep" for 25 seconds.
     
     two: # This is our second job.
       docker: # it runs inside a docker image, the same as above.
         - image: circleci/ruby:2.4.1
       steps:
         - checkout
         - run: echo "A more familiar hi" # We run a similar echo command to above.
         - run: sleep 15 # and then sleep for 15 seconds.
    
    # Under the workflows: map, we can coordinate our two jobs, defined above.
    workflows:
     version: 2
     
     one_and_two: # this is the name of our workflow
       jobs: # and here we list the jobs we are going to run.
         - one
         - two
    ```
    

### Steps

```yaml
steps:
  - run:
      name: Update apt-get
      command: sudo apt-get update
  - run:
      name: Install container dependencies
      command: sudo apt-get update && sudo apt-get install postgresql-client
```

### Variables

Use `&NAME` to setup a reference for reusable stepsand `*NAME` to use it.


```yaml
variables:
  install_dependencies: &install_dependencies
    run:
      name: Install dependencies
      command: yarn
  run_unit_tests: &run_unit_tests
    run:
      name: Run unit tests
      command: yarn test
      
# ...

jobs:
  # ...
  
  client_build_and_test:
    steps:
      - *restore_codebase
      - restore_cache:
          # ...
      - *install_dependencies
      - save_cache:
          # ...
      - *run_unit_tests
```
