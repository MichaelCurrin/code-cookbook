# Prettier

See also [Prettier](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/javascript/format-and-lint/) in my Cheatsheets.


## Samples

### Basic

- `.prettierrc.json`
    ```json
    {
      "trailingComma": "all",
      "tabWidth": 2,
      "semi": true,
      "singleQuote": false
    }
    ```
- `prettier.config.js` or `.prettierrc.js`
    ```javascript
    module.exports = {
      trailingComma: "es5",
      tabWidth: 4,
      semi: false,
      singleQuote: true,
    };
    ```
