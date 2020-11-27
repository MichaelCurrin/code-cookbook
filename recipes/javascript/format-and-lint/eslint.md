# ESLint

See also the [ESLint](https://eslint.org/) homepage.


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

### Vue.js

Generated from the [quickstart](https://github.com/MichaelCurrin/vue-quickstart/blob/master/package.json):

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

Generated from the [quickstart](https://github.com/MichaelCurrin/next-quickstart/blob/master/.eslintrc.js). Note the original generated file below means you can't read JSX syntax.

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

Generated from the [quickstart](https://github.com/MichaelCurrin/react-quickstart):

- `package.json`
    ```json
    {
      "eslintConfig": {
        "extends": "react-app"
      }
    }
    ```

Note that ESLint is handled as a dev dependency indirectly.

Recommendation from [Create React App](https://create-react-app.dev/docs/setting-up-your-editor/) guide.

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
