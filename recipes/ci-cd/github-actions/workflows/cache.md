# Cache
> Cache artifacts like dependencies and build outputs to improve workflow execution time

{% raw %}

See the [actions/cache](https://github.com/marketplace/actions/cache) page in the Actions marketplace.


## General usage

- `main.yml`
    ```yaml
    steps:
      - name: Cache
        uses: actions/cache@v2.0.0
        with:
        
        # A list of files, directories, and wildcard patterns to cache and restore
        path:
        
        # An explicit key for restoring and saving the cache
        key:
        
        # An ordered list of keys to use for restoring the cache if no cache hit occurred for key
        restore-keys: # optional
    ```


## Samples

Based on the [Examples](https://github.com/actions/cache/blob/master/examples.md) in the action's docs.

### Node and NPM

From the [Node - NPM](https://github.com/actions/cache/blob/master/examples.md#node---npm) examples.

#### Simple

The cache location will be `~/.npm` on Unix/Posix. See [NPM cache](https://docs.npmjs.com/cli/cache#cache) in the docs NPM docs.

- `main.yml`
    ```yaml
    steps:
      - name: Get cached dependencies
        uses: actions/cache@v2
        with:
          path: ~/.npm
          key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
          restore-keys: ${{ runner.os }}-node-

      - name: Install dependencies
        run: npm install
    ```

Make sure to use `npm install` and not `npm ci` - the latter will **delete** any `node_modules` directory that was retrieved from the cache and so will delete the point of using this Cache Action.

#### Using NPM config

> If using npm config to retrieve the cache directory, ensure you run `actions/setup-node` first to ensure your npm version is correct.

For a code sample, see [example](https://github.com/actions/cache/blob/master/examples.md#using-multiple-systems-and-npm-config).

#### Node and Yarn

From the [Node - Yarn](https://github.com/actions/cache/blob/master/examples.md#node---yarn) example.

This use the `yarn cache dir` to dynamically lookup where Yarn's cached packages are, so has an extra step.

- `main.yml`
    ```yaml
    steps:
      - name: Get Yarn cache directory path
        id: yarn-cache-dir-path
        run: echo "::set-output name=dir::$(yarn cache dir)"

      - uses: actions/cache@v2
        id: yarn-cache
        with:
          path: ${{ steps.yarn-cache-dir-path.outputs.dir }}
          key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
          restore-keys: ${{ runner.os }}-yarn-

      - name: Install dependencies
        run: yarn install --frozen-lockfile
    ```

Yarn help on the use of the flag:

```
    --frozen-lockfile                   don't generate a lockfile and fail if an update is needed
```

### Python

From [Python - Pip](https://github.com/actions/cache/blob/master/examples.md#python---pip) example.

A simple example.

- `main.yml`
    ```yaml
    steps:
      - uses: actions/cache@v2
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
          restore-keys: ${{ runner.os }}-pip-
    ```

### Ruby

From [Ruby - Bundler](https://github.com/actions/cache/blob/master/examples.md#ruby---bundler) example.

> When dependencies are installed later in the workflow, we must specify the same path for the bundler.

- `main.yml`
    ```yaml
    steps:
      - name: "Cache: Set up bundler cache"
        uses: actions/cache@v2
        with:
          path: vendor/bundle
          key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
          restore-keys: ${{ runner.os }}-gems-

      - name: Bundle install
        run: |
          bundle config path vendor/bundle
          bundle install --jobs 4 --retry 3
    ```

Maybe use `bundle config --local ...` as that is what I do locally.

{% endraw %}
