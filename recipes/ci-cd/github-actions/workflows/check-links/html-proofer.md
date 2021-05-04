# HTML Proofer

How to use a Ruby gem as a CLI tool to validate links in your static HTML, for both internal and external links.


## Related sections

For use of `html-proofer` outside of GH Actions or how to add it to your `Gemfile`, see the [HTML Proofer][] page in the Web recipes.

[HTML Proofer]: {{ site.baseurl }}{% link recipes/web/check-links/html-proofer.md %}


## Samples

Use a GH Actions workflow to set up Ruby and gems, build the site and then run the proofer on the build output.

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
            run: bundle exec jekyll build

          - name: Check for broken links 🧐🔗
            run: htmlproofer --log-level :debug _site 2> links.log
            continue-on-error: true

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
- A recommended setting was to use [continue-on-error][].
    - This is so that the check step doesn't stop the next from running. This would swallow any fatal errors like bad flags, instead of aborting the build.

[continue-on-error]: https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idstepscontinue-on-error

### Non-Jekyll

If not using Jekyll, then supply your own build command like

```sh
$ npm run build
```

And point the proofer tool at your build output directory.
