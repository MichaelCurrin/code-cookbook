# Prettier

JavaScript formatting with Prettier.

## Disable

Disable a line:

```
// eslint-disable-next-line prettier/prettier
```


## Resources

- [Prettier](https://prettier.io/) homepage
- [Configuration file](https://prettier.io/docs/en/configuration.html)
- [Options](https://prettier.io/docs/en/options.html)


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
