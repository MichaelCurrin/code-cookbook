---
description: Run format, lint, and test checks using Node.js
---
# Checks

This works whether you will have the app run with Node in the browser.

Some commands are for making changes and some are for running a check only (useful in a CI flow when you want logged output but don't actually want to make the commit as that makes more effort to set up and might not be suitable to apply).


## Samples

Based on [package.json](https://github.com/peaceiris/actions-gh-pages/blob/master/package.json)  from `peaceiris/actions-gh-pages` repo.

- `package.json`
    ```json
    {
      "name": "actions-github-pages",
      "version": "3.6.1",
      "description": "GitHub Actions for GitHub Pages",
      "main": "lib/index.js",
      "engines": {
        "node": ">=12.16.3",
        "npm": ">=6.14.4"
      },
      "scripts": {
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
      "husky": {
        "skipCI": true,
        "hooks": {
          "pre-commit": "lint-staged",
          "post-merge": "npm run update-deps; git remote prune origin"
        }
      },
      "lint-staged": {
        "src/**/*.ts": [
          "prettier --check",
          "eslint"
        ],
        "README.md": [
          "npx doctoc@1.4.0 --github"
        ]
      },
      "repository": {
        "type": "git",
        "url": "git+https://github.com/peaceiris/actions-gh-pages.git"
      },
      "keywords": [
        "GitHub Actions",
        "Actions",
        "JavaScript Action",
        "TypeScript Action",
        "GitHub Pages",
        "gh-pages"
      ],
      "author": "peaceiris",
      "license": "MIT",
      "bugs": {
        "url": "https://github.com/peaceiris/actions-gh-pages/issues"
      },
      "homepage": "https://github.com/peaceiris/actions-gh-pages#readme",
      "dependencies": {
        "@actions/core": "^1.2.4",
        "@actions/exec": "^1.0.4",
        "@actions/github": "^2.2.0",
        "@actions/io": "^1.0.2"
      },
      "devDependencies": {
        "@types/jest": "^25.2.3",
        "@types/js-yaml": "^3.12.4",
        "@types/node": "~12",
        "@typescript-eslint/eslint-plugin": "^2.34.0",
        "@typescript-eslint/parser": "^2.34.0",
        "@zeit/ncc": "^0.22.3",
        "eslint": "^6.8.0",
        "eslint-config-prettier": "^6.11.0",
        "eslint-plugin-jest": "^23.13.2",
        "eslint-plugin-prettier": "^3.1.3",
        "husky": "^4.2.5",
        "jest": "^25.5.4",
        "jest-circus": "^26.0.1",
        "js-yaml": "^3.14.0",
        "lint-staged": "^10.2.7",
        "prettier": "2.0.5",
        "standard-version": "^8.0.0",
        "ts-jest": "^25.5.1",
        "typescript": "^3.9.3"
      }
    }
    ```
