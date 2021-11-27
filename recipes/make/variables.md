# Variables


## From NPM

From `/usr/local/lib/npm/lib/node_modules/npm/Makefile`.

This includes use of `shell`, `git`, `find` and `sed`. Which may be of use.

The `markdowns` variable doesn't get reused. Most of the variables deal with the mandocs.

```make
SHELL = bash

PUBLISHTAG = $(shell node scripts/publish-tag.js)
BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

markdowns = $(shell find docs -name '*.md' | grep -v 'index') README.md

cli_mandocs = $(shell find docs/content/cli-commands -name '*.md' \
               |sed 's|.md|.1|g' \
               |sed 's|docs/content/cli-commands/|man/man1/|g' ) \
               man/man1/npm-README.1 \
               man/man1/npx.1

files_mandocs = $(shell find docs/content/configuring-npm -name '*.md' \
               |sed 's|.md|.5|g' \
               |sed 's|docs/content/configuring-npm/|man/man5/|g' ) \

misc_mandocs = $(shell find docs/content/using-npm -name '*.md' \
               |sed 's|.md|.7|g' \
               |sed 's|docs/content/using-npm/|man/man7/|g' ) \

mandocs = $(cli_mandocs) $(files_mandocs) $(misc_mandocs)

# ...

mandocs: $(mandocs)

htmldocs:
	cd docs && node ../bin/npm-cli.js install && \
	node ../bin/npm-cli.js run build:static echo>&2 && \
	rm -rf node_modules .cache public/*js public/*json public/404* public/page-data public/manifest*

docs: mandocs htmldocs
```

Also of interest from there. How to create a directory (`-p` actually means the `-d` check could have been skipped. How to escape `< @`.

```make
man/man7/%.7: docs/content/using-npm/%.md scripts/docs-build.js package.json $(build-doc-tools)
	@[ -d man/man7 ] || mkdir -p man/man7
	node scripts/docs-build.js $< $@
```
