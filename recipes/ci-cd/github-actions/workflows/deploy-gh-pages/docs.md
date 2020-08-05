# Docs

This example is based on a [PR](https://github.com/jekyll/jekyll/pull/8201/files) for building the Jekyll docs using GH Actions instead of plain GH Pages flow.

Note these steps around Bundler and committing and publishing to GH Pages are very low-level. However, this was preferred when I brought it up on the PR as it provides more control over logging and I think it also reduces dependency on actions which might not be maintained or that do things it a way that is not ideal here.

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
              
          - name: Build site
            run: bundle exec jekyll build --source docs --destination docs/_site --verbose --trace
            env:
              JEKYLL_PAT: ${{ secrets.GITHUB_TOKEN }}
              
          - name: Deploy to GitHub Pages
            run: |
              SOURCE_COMMIT="$(git log -1 --pretty="%an: %B" "$GITHUB_SHA")"
              
              pushd docs/_site &>/dev/null
              
              : > .nojekyll
              
              REMOTE_REPO="https://${GITHUB_ACTOR}:${{ secrets.GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}.git"
              REMOTE_BRANCH="${REMOTE_BRANCH:-gh-pages}"
              
              echo "Publishing to ${GITHUB_REPOSITORY} on branch ${REMOTE_BRANCH}"
              git init --quiet
              git config user.name "${GITHUB_ACTOR}"
              git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
              git add --all
              git commit --quiet \
                --message "Deploy docs from ${GITHUB_SHA}" \
                --message "$SOURCE_COMMIT"
              git push "$REMOTE_REPO" "+HEAD:${REMOTE_BRANCH}"
              
              popd &>/dev/null
    ```
