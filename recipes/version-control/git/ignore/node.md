# Node


## Build

A Node app which builds to `dist`. If you use `build`, then replace `dist` below.

For a Yarn app, it's good to ignore NPM logs too, in case NPM is used. You can leave off the Yarn ones if not needed.

```
node_modules/
dist/

npm-debug.log*
yarn-debug.log*
yarn-error.log*
```

Use that as a base and then add on using the sections below.

## Env file

Based on a React quickstart.

```
.env.local
.env.development.local
.env.test.local
.env.production.local
```

## Coverage

```
coverage/
.nyc_output
```


## Basement

```
.basement
basement_dist
```


## VuePress app

Auto-generated from VuePress.

```
pids
logs
node_modules
npm-debug.log
coverage/
run
dist
.DS_Store
.nyc_output
.basement
config.local.js
basement_dist
```
