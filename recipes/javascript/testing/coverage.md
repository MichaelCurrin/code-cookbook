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
        "coverage": "nyc npm test"
      }
    }
    ```

Then run:

```sh
$ npm run coverage
```

### Docs example setup

From [Combining reports from multiple runs](https://github.com/istanbuljs/nyc/blob/master/README.md#combining-reports-from-multiple-runs).

```json
{
  "scripts": {
    "cover:unit": "nyc --silent npm run test:unit",
    "cover:integration": "nyc --silent --no-clean npm run test:integration",
    "cover:report": "nyc report --reporter=lcov --reporter=text",
    "cover": "npm run cover:unit && npm run cover:integration && npm run cover:report"
  }
}
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
- Tests, followed by CLI coverage report.
    ```sh
    $ npm run test:coverage
    ```
- Create HTML report.
    ```sh
    $ npm run test:report
    ```
    
Sample CLI report:

```
----------------------|---------|----------|---------|---------|-------------------
File                  | % Stmts | % Branch | % Funcs | % Lines | Uncovered Line #s 
----------------------|---------|----------|---------|---------|-------------------
All files             |   91.63 |    87.85 |   88.24 |   91.28 |                   
 src                  |   62.16 |    33.33 |   44.44 |   62.16 |                   
  prepareCommitMsg.ts |   62.16 |    33.33 |   44.44 |   62.16 | 75-126,139-142    
 src/generate         |      97 |    96.83 |   95.24 |   96.91 |        
 ...
```

### Configuration

See [Common Configuration Options](https://github.com/istanbuljs/nyc#common-configuration-options)

Or see output of:

```sh
$ npx nyc --help
```

For config filenames see [Configuration files](https://github.com/istanbuljs/nyc/blob/master/README.md#configuration-files) in the docs.

Example of CLI config usage:

> ... the following command executes ava, and indicates to `nyc` that it should output both an `lcov` (`lcov.info` + `html` report) and a text-summary coverage report.

```sh
$ nyc --reporter=lcov --reporter=text-summary ava
```

You might like to add  the`--silent` flag.

### Check coverage

Fail a check if coverage drops below any thresholds.

> Check whether the JSON in nyc's output folder meets the thresholds provided

```sh
$ nyc check-coverage --lines 95
```

You can pass arguments as `--lines`, `--statements`, `--functions` and `--branches`.

The default is to fail is any of those drop below 100%. You might like to be less strict at 80%.

From the CLI help for that subcommand:

Flag | Description | Default
---  | --- | ---
`--branches` | what % of branches must be covered? | `0`
`--functions` | what % of functions must be covered? | `0`
`--lines` | what % of lines must be covered? | `90`
`--statements` | what % of statements must be covered? | `0`

You can also set high and low [watermarks](https://github.com/istanbuljs/nyc/blob/master/README.md#high-and-low-watermarks).


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

### Collect coverage

Note use of collect coverage setting. Rather than only collecting coverage metrics for scripts and specs that run, include untested files as part of the coverage stats.

A solution from issue - [Jest is "stuck" on only generating coverage for tested files, instead of all files #8310](https://github.com/facebook/jest/issues/8310#issuecomment-703086603).

```json
{
  "jest": {
    "collectCoverageFrom": [
      "src/**/*.js"
    ],
    "collectCoverage": true,
    
    "verbose": true,
    "testTimeout": 30000,
    "roots": [
      "<rootDir>/tests",
      "<rootDir>/src"
    ],
    "testRegex": "((\\.|/*.)(test))\\.js?$",
    
    "moduleFileExtensions": [
      "ts",
      "tsx",
      "js",
      "jsx",
      "json",
      "node"
    ]
  }  
}
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
