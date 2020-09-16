# Code Cookbook 👩‍💻👨‍🍳📖🥗
> Reusable code patterns which you can use as reference or copy to your project

[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/code-cookbook)](https://github.com/MichaelCurrin/code-cookbook/tags/?include_prereleases&sort=semver)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue)](#license)
![Commit activity](https://img.shields.io/github/commit-activity/m/michaelcurrin/code-cookbook)

<!-- Too noisy so stopped it
![Check markdown links](https://github.com/MichaelCurrin/code-cookbook/workflows/Check%20markdown%20links/badge.svg)
-->

## Cookbook overview

- [Recipe categories](/recipes/) - start here to browse topics and languages that interest you.
- [Make](/recipes/make/) - `Makefile` samples
- [CI/CD](/recipes/ci-cd/)
    - Many language-specific sample [workflows](https://github.com/MichaelCurrin/code-cookbook/tree/master/recipes/ci-cd/github-actions/workflows) for GH Actions to test and deploy your app
    - Plus some _Netlify_ configs.
- [SEO](/recipes/seo)
    - Recipes for [robots.txt](/recipes/seo/robots/) and [sitemap.xml](/recipes/seo/sitemap/) files.
- [Shell](/recipes/shell/) - usage help and examples for commands and patterns to use one or more commands to solve a real problem. Such as how to do find and replace using `find` or `sed` or how to clean up your git repo.
- [Jekyll](/recipes/jekyll/) - code snippets and configs
- [Containers](/recipes/containers) - commands and configs for using Docket and k8s.


## Purpose

This is my collection of reusable code samples and instructions, arranged in a way like recipes so that you can use an entire file to solve a task and not just look for one line like in a cheatsheet guide.

Here you'll find code snippets in Jekyll, Bash, Python or JS. And some entire files you can copy in part or as a whole for your Makefile or deploy pipeline config.


## Background

I have written and refined some of these recipes myself from my dev experience. Or I have copied from other sources like tutorials or other repos. I give credit as much as possible to the orginal source. Sometimes I don't even understand how a file works, but I know what it does and that it will be useful one day so I stash it as a reference in this centralized repo. This suits my learning style as I like to learn by example and real-world use, not just memorizing syntax and definitions.

This collection approach I use it also great because I can collect code by myself or others which solves similar problems or the same problem (e.g. deploy a site) and then I can **compare** the solutions. I can choose one that makes sense for my situation or I can take the best parts from each solution and make a new entry, which becomes my go-to solution for keeping my projects consistent.

<!-- TODO move to About section or new page.

Sometimes the "recipe" in a directory is a group of scripts and possibly configs which work together.

Sometimes there is just a collection of ingredients which are similar and can be used in a larger recipe. For example, a collection of ESLint config files from various sources, or some boilerplate HTML and CSS to add an element to a Jekyll site.

I have a lot of template or "quickstart" repos on GitHub, but sometimes there are too specific for a larger setup. So this cookbook repo can take the most useful parts of those repos and put them in here as snippets with detail comments. This is a nice balance between entire files or projects which are not all relevant (or up to date) and giving one-line definitions of fields and allowed values.

A collection of answers to coding problems I come across, so I can refer back here to see what a few good approaches are.

Like a cheatsheet, but rather than one-line commands or code blocks, the answer is a longer file, a combination of files, or series of steps to follow.

Some answers will be boilerplate that you can copy to your project as is, with a few values possibly to configure.

Some content will be steps to follow in the command-line and not so much code to write.

The explanations are steps are more thorough than would fit in a cheatsheet and a cheatsheet would be more low-level pieces than a set of instructions. Though the emphasis is more on the content rather than steps to follow.

The solutions are based on my experienced or copied from other projects that I find, as a reference for how to something.

This project does not cover steps on install tools but rather how to use them.

This project is partly based on a principle in the book [Steal like an artist](https://www.amazon.com/Steal-Like-Artist-Things-Creative/dp/0761169253) which recommends making a stash of things that resonate with you and you can use an inspiration. Whether music, pictures, code... Note the book discourages plagiarism but focuses on the idea that nothing is truthy original, so use pieces that you find and rework them and make them yours in something new. This Code Cookbook is my collection or stash, using links and credits as much as possible to repos and docs, so I can draw on trusted examples when I need a reference.

-->

## Contributing

Contributions of new content or fixes are welcome. 

Please submit an issue or add a Pull Request from your forks's feature branch with a description of changes - see [Contributing doc](/CONTRIBUTING.md).


## License

Released under [MIT](/LICENSE).

- If you use a significant portion of this project in your own repo, please include a copy of this project's license in your repo (e.g. as `LICENSE-source` and add a link back to https://github.com/MichaelCurrin/code-cookbook/ somewhere in your docs.
- If you fork this repo just for fun or to contribute back, you don't need to update the `LICENSE` file.
- But if your fork this repo and make significant changes without planning to contribute back with a PR, that's fine - just please include a copy of the original license in your fork:
    ```sh
    $ # Copy the original repo.
    $ cp LICENSE LICENSE-source
    $ # Put your own name in your fork's license.
    $ open LICENSE  
    ```
