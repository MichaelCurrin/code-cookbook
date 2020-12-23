---
description: How to keep git tags in sync with GitHub for an NPM project
---
# NPM version

Note: If you only tag your repo using the CLI and not the GitHub UI, you can leave off the fetch. As `npm version` will use the `"version"` field in `package.json` to incremen the tag, not git tags.

### Manual

```sh
$ git fetch --tags
$ npm version minor
$ git push --follow-tags
```

Or

```sh
$ git fetch --tags && npm version minor && git push --follow-tags
```

### Package commands

Or setup your `package.json`:

```json
{
    "scripts": {
        "preversion": "git fetch --tags",
        "postversion": "git push --follow-tags"
    }
}
```

And run:

```sh
$ npm version
```
