---
title: HTML Proofer generic
description: Install and run the `html-proofer` gem with a generic Ruby action setup
---

How to use a Ruby gem as a CLI tool to validate links in your static HTML, for both internal and external links.


## Related sections

- [HTML Proofer gem][] page in the Web recipes.
    - For use of `html-proofer` outside of GH Actions or how to add it to your `Gemfile`, see the
- [HTML Proofer wrappers][]

[HTML Proofer gem]: {{ site.baseurl }}{% link recipes/web/check-links/html-proofer.md %}
[HTML Proofer wrappers]: {{ site.baseurl }}{% link recipes/ci-cd/github-actions/workflows/check-links/html-proofer-wrappers.md %}

## Samples

Use a GH Actions workflow to set up Ruby and gems, build the site and then run the proofer on the build output.

You might want to run the checker every time you build your site on your main branch and on a PR (so you can block bad code from being merged). Or you might run on a schedule, maybe against an existing output directory on `gh-pages` branch instead of as a fresh build. See my [Workflow Builder][] for more info.

[Workflow Builder]: https://michaelcurrin.github.io/workflow-builder/#triggers

### Jekyll site

The example here is targeted at a Jekyll static site and is based on this blog post - [Automatically Validate Links on a Jekyll Website][].

[Automatically Validate Links on a Jekyll Website]: https://clementbm.github.io/github%20action/jekyll/link%20checking/2020/05/31/automatically-validate-links-on-jekyll-website.html)

- `main.yml`
    ```yaml
    jobs:
      check-links:
        name: Check links

        runs-on: ubuntu-latest

        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@v2

          - name: Set up Ruby 💎
            uses: ruby/setup-ruby@v1
            with:
              ruby-version: '2.7'
              bundler-cache: true

          - name: Install HTML Proofer 🔧
            run: gem install html-proofer

          - name: Build 🏗
            run: bundle exec jekyll build --trace

          - name: Check for broken links 🧐🔗
            run: htmlproofer --log-level :debug _site 2> links.log

          - name: Archive checker log 🗄
            uses: actions/upload-artifact@v1
            with:
              name: links-check.log
              path: links.log
    ```

Notes:

- If you prefer to install `html-proofer` from gems in your `Gemfile`:
    - Take out the `gem install GEM_NAME` step.
    - Change the _Check for broken links_ step to be `bundle exec htmlproofer ARGS`.
- The tool prints `stdout` as a count of URLs and files (a few lines only). The `stdout` content is the actually check breakdown, which can very long.
- This example persists the checker log as an uploaded file.
    - This makes it easier to view rather than as a part of the long workflow log.
    - Note that using `&>` will send both `stdout` and `stderr` to the file log (and print nothing in the workflow log), while using `2>` will send only the URL checks on `stderr` to the file log and still print a summary numbers in the workflow log.

### Generic

Here for project not based on Ruby or Jekyll, but still need Ruby set up.

Supply your own build command for the Build step. And point the proofer tool at your build output directory, like `build` or `out`.

```yaml
steps:
  # ...

  - name: Build 🏗
    run: npm run build

  - name: Check for broken links 🧐🔗
    run: htmlproofer --log-level :debug build
```


## Handling errors

The default behavior of the tool is to exit on an non-zero exit code on at least one URL error.

This would swallow any fatal errors like bad flags, aborting the build and therefore stopping a deploy.

But if you don't care about breaking links, especially if the testing is intermittent, then you can use the [continue-on-error][] field.

e.g.

```yaml
- name: Check for broken links 🧐🔗
  run: htmlproofer # ...
  continue-on-error: true
```

This is so that the check step doesn't stop the workflow and mark it as failed.

[continue-on-error]: https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstepscontinue-on-error
