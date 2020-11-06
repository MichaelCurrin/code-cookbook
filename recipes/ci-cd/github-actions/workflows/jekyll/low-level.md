# Low-level
> Run Jekyll against the docs directory and publish to GH Pages, using generic actions

{% raw %}

This example is based on a [PR](https://github.com/jekyll/jekyll/pull/8201/files) for building Jekyll's own docs site at [jekyllrb.com](https://jekyllrb.com), using GH Actions instead of plain GH Pages flow. The code is very low-level for more control but this makes it so not reusable. There are further notes at the end of this page on this. You may want to take pieces of this recipe rather than the whole thing.

Note use of `GITHUB_TOKEN` near the end.

- `docs.yaml`
    ```yaml
    name: Build and deploy Jekyll documentation site

    on:
      pull_request:
        branches:
          - master

    env:
      RUBY_VERSION: 2.7

    jobs:
      deploy_docs:
        if: "!contains(github.event.commits[0].message, '[ci skip]')"

        runs-on: 'ubuntu-latest'

        steps:
          - uses: actions/checkout@v2
          
          - uses: actions/setup-ruby@v1
            with:
              ruby-version: ${{ env.RUBY_VERSION }}

          - name: Setup cache for Bundler
            id: cache
            uses: actions/cache@v2
            with:
              path: vendor/bundle
              key: ${{ runner.os }}-bundler-${{ env.RUBY_VERSION }}-${{ hashFiles('Gemfile') }}-${{ hashFiles('jekyll.gemspec') }}
              restore-keys:
                - ${{ runner.os }}-bundler-${{ env.RUBY_VERSION }}-${{ hashFiles('Gemfile') }}-
                - ${{ runner.os }}-bundler-${{ env.RUBY_VERSION }}-

          - name: Set up dependencies
            run: |
              gem update --system --no-document
              gem update bundler --no-document
              bundle install --path=vendor/bundle --jobs 4 --retry 3
              bundle clean

          - name: Clone target branch
            run: |
              REMOTE_BRANCH="${REMOTE_BRANCH:-gh-pages}"
              REMOTE_REPO="https://${GITHUB_ACTOR}:${{ secrets.GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}.git"
              echo "Publishing to ${GITHUB_REPOSITORY} on branch ${REMOTE_BRANCH}"
              rm -rf docs/_site/
              git clone --depth=1 --branch="${REMOTE_BRANCH}" --single-branch --no-checkout \
                "${REMOTE_REPO}" docs/_site/

          - name: Build site
            run: bundle exec jekyll build --source docs --destination docs/_site --verbose --trace
            env:
              # For jekyll-github-metadata plugin.
              JEKYLL_GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

          - name: Deploy to GitHub Pages
            run: |
              SOURCE_COMMIT="$(git log -1 --pretty="%an: %B" "$GITHUB_SHA")"
              pushd docs/_site &>/dev/null
              : > .nojekyll
              git add --all
              git -c user.name="${GITHUB_ACTOR}" -c user.email="${GITHUB_ACTOR}@users.noreply.github.com" \
                commit --quiet \
                --message "Deploy docs from ${GITHUB_SHA}" \
                --message "$SOURCE_COMMIT"
              git push
              popd &>/dev/null
    ```


## Notes on usage

Note these steps around Bundler and committing and publishing to GH Pages are very low-level. I wouldn't use this across many projects myself as it would be tedious to maintain and not DRY and also I do not care about this level of control when using a single action for whole flow meets my needs. However, I might use the first few steps to manage cache, dependencies and building the site, but then rely on a more generic Action to handle committing to the `gh-pages` branch. 

The detailed steps are preferred by the maintainers, when I brought it up on the PR. The comment was that this provides more control over logging and commit messages. At the cost of having to maintain boilerplate instead of having it maintained in a separate action (which means less control and a different kind of risk of commands going out of date or security issues). I think it also reduces dependency on actions which might not be maintained or that do things it a way that is not ideal here.

These steps are also intended to be used by GH and Jekyll experts and also involves a lot of boilerplate which has to be maintained. So for other projects it may make sense to use existing actions and therefore keep your workflow file shorter and simpler, and easier to maintain across many Jekyll projects. The burden of maintaining the code (for example as Bundler CLI changes) and making good choices (around Ruby, Bundler, publishing) then falls on action maintainers, which is a different kind of risk but less effort to use.

{% endraw %}
