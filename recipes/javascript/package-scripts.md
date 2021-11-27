# Package scripts

Useful commands to put in the `scripts` section of `package.json` file.

From [source](https://github.com/actions/checkout).

```json
{
  "scripts": {
    "build": "tsc && ncc build && node lib/misc/generate-docs.js",
    "format": "prettier --write **/*.ts",
    "format-check": "prettier --check **/*.ts",
    "lint": "eslint src/**/*.ts",
    "test": "jest"
  }
}
```
