# Paths

## Directory

Get full directory of page:

```
page.dir
```

Get just the directory name:

```
page.dir | split: '/' | last
```

## Filename

Filename:

```
page.name
```

Get filename excluding suffix:

```
page.name | remove: '.md'
```
