# GitHub Actions recipes


## About

This section covers how to use GitHub Actions in a CI/CD flow such as you run automated tests, deploy and publish your repo. All running for free in the cloud whenever the workflow is triggered such as with a push or merged Pull Request.

To use GH Actions, you must create a workflow YAML file with appropriate fields set including triggers and steps. You can write shell commands as _steps_ and you can use use actions from the GH Marketplace to help you setup your environment (install a language and packages) and perform test and deploy steps, without you having to write a lot of code.


## How to get started

- [Basic generic workflow](workflows/basic.md) 
    - A sample which covers the minimum fields
- [Basic node workflow](workflows/node/basic.md)
    - Simple sample of running a Node.js app pipeline.
 - [Workflows](workflows/) section 
    - See sample workflows across programming languages.

Or use this GH Actions section of the cook to learn more about [jobs](jobs.md) and [triggers](triggers.md) from samples and instructions.

See the first link under external resources below for a beginner's guide to setting up workflows.
