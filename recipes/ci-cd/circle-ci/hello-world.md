# Hello World

From the CircleCI generated file.

We use the latest 2.1 version of CircleCI pipeline process engine. See: [reference](https://circleci.com/docs/2.0/configuration-reference)

We have the welcome orb as a dependency.

We have one workflow named "welcome" and it has one job.

```yaml
version: 2.1

orbs:
  welcome: circleci/welcome-orb@0.4.1
  
workflows:
  welcome:
    jobs:
      - welcome/run
```
