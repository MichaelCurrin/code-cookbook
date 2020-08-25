# Cache
> Cache artifacts like dependencies and build outputs to improve workflow execution time

See [actions/cache](https://github.com/marketplace/actions/cache) in the actions marketplace.


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

See [Examples](https://github.com/actions/cache/blob/master/examples.md) in the `actions/cache` action's docs.

### Node and NPM

From [Node - NPM](https://github.com/actions/cache/blob/master/examples.md#node---npm) example.

#### Simple
The cache location will be `~/.npm` on Unix/Posix. See [NPM cache](https://docs.npmjs.com/cli/cache#cache) in the docs NPM docs.

- `main.yml`
    ```yaml
    - uses: actions/cache@v2
      with:
        path: ~/.npm
        key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
        restore-keys: |
          ${{ runner.os }}-node-
    ```

### Using NPM config

> If using npm config to retrieve the cache directory, ensure you run `actions/setup-node` first to ensure your npm version is correct.

For code sample see [example](https://github.com/actions/cache/blob/master/examples.md#using-multiple-systems-and-npm-config).


### Node and Yarn

From [Node - Yarn](https://github.com/actions/cache/blob/master/examples.md#node---yarn) example.

- `main.yml`
    ```yaml
    steps:
      - name: Get yarn cache directory path
        id: yarn-cache-dir-path
        run: echo "::set-output name=dir::$(yarn cache dir)"

      - uses: actions/cache@v2
        id: yarn-cache # use this to check for `cache-hit` (`steps.yarn-cache.outputs.cache-hit != 'true'`)
        with:
          path: ${{ steps.yarn-cache-dir-path.outputs.dir }}
          key: ${{ runner.os }}-yarn-${{ hashFiles('**/yarn.lock') }}
          restore-keys: |
            ${{ runner.os }}-yarn-
    ```

### Python

From [Python - Pip](https://github.com/actions/cache/blob/master/examples.md#python---pip) example.

Simple example using `~/.cache/pip` for Ubuntu.
 
- `main.yml`
    ```yaml
    steps:
      - uses: actions/cache@v2
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-pip-
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
          restore-keys: |
            ${{ runner.os }}-gems-
       
      # ...
      
      - name: Bundle install
        run: |
          bundle config path vendor/bundle
          bundle install --jobs 4 --retry 3
    ```
