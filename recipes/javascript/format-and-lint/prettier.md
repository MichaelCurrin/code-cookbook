# Prettier

I would recommend setting up and use ESLint first as it can handle style things like quotes, semicolons and indentation and also semantic things like imports, unused variables and and syntax issues.

If you are not satisfied with ESLint, then you can add Prettier on top. This can help with formatting but not linting. Also maybe not want to add Prettier because it can conflict with ESLint and then you have to configure them both to use the same settings.


## Samples

### Basic

Copied from the docs.

You can use a JSON or JS file. Setting up a config file in JSON is best practice on general as it is not code like a JS file is.

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

### More

I found this in use on a project [here](https://github.com/vuematerial/examples/blob/master/examples/quick-start/.prettierrc) and copied it.

- `.prettierrc.json`

```json
{
  "printWidth": 80,
  "tabWidth": 2,
  "useTabs": false,
  "semi": false,
  "singleQuote": true,
  "trailingComma": "none",
  "bracketSpacing": false,
  "jsxBracketSameLine": false
}
```


## VS Code notes

You can Install prettier globally, in a project, or as an extension.

The Prettier Now extension for VS Code works well. If using VS Code Prettier or related extensions (such as for formatting with semicolons), be sure to set space to 2 and disable tabs in the config. These will be applied when the file is saved and unfortunately the EditorConfig is not picked up.

When running NPM commands that update `package.json`, the file will be updated by NPM. If you run Prettier formatting against the file, it will wrap it differently. Therefore I found it safest to use the _JSON language features_ extension as the defualt formatter, as this keeps in line with the NPM formatting.
