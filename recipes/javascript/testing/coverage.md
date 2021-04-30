# Coverage


## nyc

Repo: [istanbuljs/nyc](https://github.com/istanbuljs/nyc)

### Standard setup

From the README:

- `package.json`
    ```json
    {
      "scripts": {
        "test": "mocha",
        "coverage": "nyc npm run test"
      }
    }
    ```

Then run:

```sh
$ npm run coverage
```

### Auto Commit Message project setup

From [package.json](https://github.com/MichaelCurrin/auto-commit-msg/blob/master/package.json)

This project compiles TypeScript to `out` and runs against there. But you could use some other test directory.

- `package.json`
    ```json
    {
      "scripts": {
        "test:unit": "cd out && mocha --recursive",
        "test": "npm run test:unit",
        "test:coverage": "nyc npm test",
        "test:report": "nyc report --reporter=lcov"
      },

      "devDependencies": {
        "mocha": "^8.3.2",
        "nyc": "^15.1.0"
    }
    ```
- `.gitignore`
    ```
    .nyc_output/
    coverage/
    ```

Then run:

- Tests with no coverage.
    ```sh
    $ npm run test:coverage
    ```
- With coverage.
    ```sh
    $ npm run test:coverage
    ```
- Create HTML report.
    ```sh
    $ npm run test:report
    ```

### Configuration

```sh
$ nyc --reporter=lcov --reporter=text-summary ava
```

See [Common Configuration Options](https://github.com/istanbuljs/nyc#common-configuration-options)

Or see output of:

```sh
$ npx nyc --help
```


## Istanbul

This is deprecated. Using [nyc](#nyc) instead.

On installing Istanbul:

```
npm WARN deprecated istanbul@0.4.5: This module is no longer maintained, try this instead:
npm WARN deprecated   npm i nyc
```

## Jest

```sh
$ npm i -D jest
```

Set up your `npm test:coverage` command to do this:

```sh
$ jest --coverage
```

- `.gitignore`
    ```
    coverage/
    ```
    
Then run:

```sh
$ npm test:coverage
```


## Vue and Jest

Note that from the Vue CLI help, _all jest command line options are supported_.

- `package.json`
    ```json
    {
      "scripts": {
        "test:coverage": "vue-cli-service test:unit --detectOpenHandles --coverage",
      }
    }
    ```
- `.gitignore`
    ```
    coverage/
    ```

Then run:

```sh
$ npm test
$ # OR
$ yarn test
```
