# All

A sample to format, lint, test, and build.

Based on [package.json](https://github.com/peaceiris/actions-gh-pages/blob/fe5636cf9590ebe01679f64b7b359c74c71ebe03/package.json).


```json
{
  "scripts" {
    "all": "npm run format && npm run lint && npm test",
    "lint": "eslint ./{src,__tests__}/**/*.ts",
    "lint:fix": "eslint --fix ./{src,__tests__}/**/*.ts",
    "test": "jest --coverage --verbose --detectOpenHandles",
    "build": "ncc build ./src/index.ts -o lib --minify",
    "tsc": "tsc",
    "format": "prettier --write **/*.ts",
    "format:check": "prettier --check **/*.ts",
    "release": "standard-version",
    "update-deps": "(git diff 'HEAD@{1}' --name-only | grep 'package-lock.json' > /dev/null) && npm ci || :"
  },
  "devDependencies": {
    "eslint": "^6.8.0",
    "eslint-config-prettier": "^6.11.0",
    "eslint-plugin-jest": "^23.13.2",
    "eslint-plugin-prettier": "^3.1.3",

    "prettier": "2.0.5",
  }
}
```
