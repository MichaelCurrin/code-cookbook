# Node

Your output directory might be something than `build`, such as `dist` or `out`. You might also build testing and linting into your build command.

Using NPM.

```toml
[build]
  command = "npm test && npm run build"
  publish = "build"
```

Using Yarn.

```toml
[build]
  command = "yarn test && yarn build"
  publish = "build"
```
