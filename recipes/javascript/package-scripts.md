# Package scripts

Useful commands to put in the `scripts` section of `package.json` file for quality checks.

From [source](https://github.com/actions/checkout).

```json
{
  "scripts": {
    "format": "prettier --write **/*.ts",
    "format-check": "prettier --check **/*.ts",
    "lint": "eslint src/**/*.ts",
    "test": "jest"
  }
}
```
