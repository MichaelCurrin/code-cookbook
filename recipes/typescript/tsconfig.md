# TS Config

Customize the `tsconfig.json` or `jsconfig.json` file (for plain JS projects).


## Resources

- [What is a tsconfig.json](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) in TS docs
- [jsconfig.json reference](https://code.visualstudio.com/docs/languages/jsconfig) on VS Code docs.


## Recommended fields

You don't need a config, if you are happy with the system defaults.

Here are some fields you can add.

```json
{
  "compilerOptions": {
    "strict": true
  }
}
```

### Module and target

Using `import/export` and modern JS.

```json
{
  "compilerOptions": {
    "module": "esnext",
    "target": "esnext",
}
```

Using `require` to import and transpiling to ES6 (or ES5 if you prefer) from something newer like ES7.

```json
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "es6"
  }
}
```

### Paths

Alias the `src` directory as `@`.

```json
{
  "compilerOptions": {
    "paths": {
      "@/*": [
        "src/*"
      ]
    }
  }
}
```

### Include and exclude

For a Vue project with tests.

```json
{
  "compilerOptions": {
    "include": [
      "src/**/*.ts",
      "src/**/*.vue",
      "tests/**/*.ts"
    ]
  }
}
```


## Sample files in repos

- Vue apps.
    - [vue-typescript-quickstart](https://github.com/MichaelCurrin/vue-typescript-quickstart/blob/master/tsconfig.json) - a basic Vue TypeScript app.
    - [badge-generator](https://github.com/MichaelCurrin/badge-generator/blob/master/tsconfig.json)
- VS Code Extensions.
    - [vsc-extension-quickstart](https://github.com/MichaelCurrin/vsc-extension-quickstart/blob/master/tsconfig.json)
    - [auto-commit-msg](https://github.com/MichaelCurrin/auto-commit-msg/blob/master/tsconfig.json)
- [JavaScript Bundling Quickstarts](https://github.com/MichaelCurrin/javascript-bundling-quickstarts/tree/master/quickstarts) - there are a few TS projects with "typscript" in the name and those have minimal TS configs.
