# Yarn, Ruby and GH Pages
> Sample workflow for a Jekyll site

This flow comes from [dev hints](https://github.com/rstacruz/cheatsheets) repo. It is low level in working with languages -it may not be efficient compared with using other actions and workflows, but it is a complete solution.
So it could be useful to learn from.

```yaml
name: Deploy
on: 
  push:
    branches:
      master
```

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
        with:
          persist-credentials: false
```

Setup Ruby, NodeJS and Yarn.

```yaml
      # https://github.com/actions/cache/blob/master/examples.md#node---yarn
      - name: "Cache: Get yarn cache directory path"
        id: yarn-cache-dir-path
        run: echo "::set-output name=dir::$(yarn cache dir)"

      - name: "Cache: Set up yarn cache"
        uses: actions/cache@v2
        id: yarn-cache
        with:
          path: ${{ steps.yarn-cache-dir-path.outputs.dir }}
          key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
          restore-keys: |
            ${{ runner.os }}-yarn-
            
      # https://github.com/actions/cache/blob/master/examples.md#ruby---bundler
      - name: "Cache: Set up bundler cache"
        uses: actions/cache@v2
        with:
          path: vendor/bundle
          key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
          restore-keys: |
            ${{ runner.os }}-gems-
            
      - name: Use Node.js
        uses: actions/setup-node@v1
        with: { node-version: '12.x' }

      - name: Use Ruby
        uses: actions/setup-ruby@v1
        with: { ruby-version: '2.7.1' }
```

Setup node packages gems.

```yaml
      - name: Setup dependencies
        run: |
          yarn --frozen-lockfile
          bundle config path vendor/bundle
          bundle install --jobs 4 --retry 3
          
      - run: yarn build
```

GitHub pages deploy.

```yaml
      - name: "Deploy to gh-pages 🚀"
        uses: JamesIves/github-pages-deploy-action@releases/v3
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          BRANCH: gh-pages
          FOLDER: _site

      - name: "Deploy to mirror 🚀"
        uses: JamesIves/github-pages-deploy-action@releases/v3
        with:
          ACCESS_TOKEN: ${{ secrets.PERSONAL_ACCESS_TOKEN }}
          REPOSITORY_NAME: rstacruz/devhints-mirror
          BRANCH: gh-pages
          FOLDER: _site
```
