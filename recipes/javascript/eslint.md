# ESlint
> Config values for ESLint

See [ESLint](https://eslint.org/) homepage.


## Samples

### Generic Node.js app

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

Generated from the quickstart:

- `package.json`
    ```json
    {
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

Generated from the quickstart:

- `.eslint.js`
    ```json
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

Generated from the quickstart:

- `package.json`
    ```json
    {
      "eslintConfig": {
        "extends": "react-app"
      }
    }
    ```

From [Create React App](https://create-react-app.dev/docs/setting-up-your-editor/) guide.

- `.eslint.json`
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
