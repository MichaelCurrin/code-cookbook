# Prettier


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


## VS Code notes

You can Install prettier globally, in a project, or as an extension.

The Prettier Now extension for VS Code works well. If using VS Code Prettier or related extensions (such as for formatting with semicolons), be sure to set space to 2 and disable tabs in the config. These will be applied when the file is saved and unfortunately the EditorConfig is not picked up.

When running NPM commands that update `package.json`, the file will be updated by NPM. If you run Prettier formatting against the file, it will wrap it differently. Therefore I found it safest to use the _JSON language features_ extension as the defualt formatter, as this keeps in line with the NPM formatting.
