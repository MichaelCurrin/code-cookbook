# GitHub Actions recipes

## Intro

This section covers how to use GitHub Actions in a CI/CD flow such as you run automated tests, deploy and publish your repo. All running for free in the cloud whenever the workflow is triggered such as with a push or merged Pull Request.

To use GH Actions, you must create a workflow YAML file with appropriate fields set including triggers and steps. You can write shell commands as steps and you can use use actions from the GH Marketplace to help you setup your environment (install a language and packages) and perform test and deploy steps, without you having to write a lot of code.

Check the [Basic workflow](workflows/basic.md) for a sample which covers the minimum fields or the [Workflows](workflows/) section to see sample workflows across programming languages.

Or use this section to learn more about [jobs](jobs.md) and [triggers](triggers.md) from samples and instructions.


## Resources

- [Configuring and managing workflows](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow) from actions docs
- [Syntax](https://help.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Github Actions Documentation](https://help.github.com/en/actions)
- [Github Actions](https://github.com/actions) org on Github
- The [Github Actions](https://github.community/c/github-actions) community forums


## Limitations

[Intro to Github Actions blog post](https://gabrieltanner.org/blog/an-introduction-to-github-actions)

> Actions are completely free for every open-source repository and include **2000 free build minutes per month** for all your private repositories which is comparable with most CI/CD free plans. If that is not enough for your needs you can pick another plan or go the self-hosted route.
