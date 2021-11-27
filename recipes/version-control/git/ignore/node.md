# Node


## Build

A Node app which builds to `dist` or `build` or similar. 

For a Yarn app, it's good ot ignore NPM logs too in case NPM is used. You can leave off the Yarn ones if not needed.

```
node_modules/
dist/

npm-debug.log*
yarn-debug.log*
yarn-error.log*
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


## VuePress

Auto-generated for VuePress.

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
