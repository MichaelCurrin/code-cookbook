# ESLint


## Resources

- [ESLint](https://eslint.org/) homepage.
- [ESlint](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/format-and-lint/eslint.html) page on my Dev Cheatsheets.


## Samples

### Generic Node.js app

From [Node Project Template](https://github.com/MichaelCurrin/node-project-template):

- `package.json`
    ```json
    {
      "devDependencies": {
        "eslint": "^7.7.0"
      }
    }
    ```
- `.eslint.js`
    ```javascript
    // eslint-disable-next-line no-undef
    module.exports = {
      root: true,
      env: {
        browser: true,
        es2020: true
      },
      extends: 'eslint:recommended',
      parserOptions: {
        ecmaVersion: 12,
        sourceType: 'module'
      },
      rules: {
        semi: [
          2,
          'always'
        ]
      }
    };
    ```

### TypeScript

A reference from my [AutoCommitMsg](https://github.com/MichaelCurrin/auto-commit-msg/blob/master/.eslintrc.js) VS Code extension which is in TypeScript.

The rules were empty, but I added some.

- `.eslintrc.js`
    ```javacsript
    /**@type {import('eslint').Linter.Config} */
    // eslint-disable-next-line no-undef
    module.exports = {
      root: true,
      parser: '@typescript-eslint/parser',
      plugins: [
        '@typescript-eslint',
      ],
      extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended',
      ],
      rules: {
        'semi': [
          2,
          'always',
        ],
        'comma-dangle': [
          2,
          'always-multiline',
        ],
        'quotes': [
          2,
          'single',
        ],
        '@typescript-eslint/no-unused-vars': 0,
        '@typescript-eslint/no-explicit-any': 0,
        '@typescript-eslint/explicit-module-boundary-types': 0,
        '@typescript-eslint/no-non-null-assertion': 0,
      },
    };
    ```

### Vue.js

Generated from the Create Vue App flow. See my [vue-quickstart](https://github.com/MichaelCurrin/vue-quickstart/blob/master/package.json) repo.

- `package.json`
    ```json
    {
      "devDependencies": {
        "eslint": "^6.7.2",
        "eslint-plugin-prettier": "^3.1.4",
        "eslint-plugin-vue": "^6.2.2"
      },
      "eslintConfig": {
        "root": true,
        "env": {
          "node": true
        },
        "extends": [
          "plugin:vue/essential",
          "eslint:recommended",
          "@vue/prettier"
        ],
        "parserOptions": {
          "parser": "babel-eslint"
        },
        "rules": {}
      }
    }
    ```

### Next.js

Generated from the Create Next App flow. See my [next-quickstart](https://github.com/MichaelCurrin/next-quickstart/blob/master/.eslintrc.js) repo. Note the original generated file below means you can't parse JSX syntax.

- `.eslint.js`
    ```javascript
    // eslint-disable-next-line no-undef
    module.exports = {
      root: true,
      env: {
        browser: true,
        es2020: true
      },
      extends: 'eslint:recommended',
      parserOptions: {
        ecmaVersion: 12,
        sourceType: 'module'
      },
      rules: {
        semi: [
          2,
          'always'
        ]
      }
    };
    ```

### React

Generated from the Create React App flow. See my [react-quickstart](https://github.com/MichaelCurrin/react-quickstart) repo.

- `package.json`
    ```json
    {
      "eslintConfig": {
        "extends": "react-app"
      }
    }
    ```

Note that ESLint is handled as a subdependency and so it not in the `package.json` file.

Here is the recommendation from the [Create React App](https://create-react-app.dev/docs/setting-up-your-editor/) guide.

- `package.json`
    ```json
    {
      "eslintConfig": {
        "extends": ["react-app", "shared-config"],
        "rules": {
          "additional-rule": "warn"
        },
        "overrides": [
          {
            "files": ["**/*.ts?(x)"],
            "rules": {
              "additional-typescript-only-rule": "warn"
            }
          }
        ]
      }
    }
    ```
