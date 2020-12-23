---
description: Exporting variables in Makefiles
---
# Exports

## Sample

I don't know if these defaults are actually used here.


- `defaults.mk`
    ```Makefile
    TF_VAR_environment=${ENVIRONMENT}
    TF_VAR_program=${PROGRAM}

    export
    ```
- `Makefile`
    ```Makefile
    include defaults.mk

    check-env :
      @echo "ENVIRONMENT is only 'prod'. And needed for backwards compatibility. Exporting... ";
      @export ENVIRONTMENT=prod;
      @if [ -z $(PROGRAM) ]; then \
        echo "PROGRAM must be set; export PROGRAM=<program>"; exit 10; \
      fi
    ```

## StackOverflow sample

[link](https://stackoverflow.com/questions/24263291/define-a-makefile-variable-using-a-env-variable-or-a-default-value)

- `Makefile`
    ```Makefile
    T ?= foo
    all:
            : '$(T)'
    ```

```sh
$ make
: 'foo'

$ make T=bar
: 'bar'

$ T=bar make
: 'bar'
```

See [Overriding variables](https://www.gnu.org/software/make/manual/make.html#Overriding) in the Make docs.

Or

- `Makefile`
    ```Makefile
    TMPDIR := "/tmp"
    test:
        @echo $(TMPDIR)
    ```

```sh
$ make TMPDIR=foo
foo
```



For debugging, check the value of the token.

B. Only run this on a remote if the logs are private, so no one steals your token on a PR preview. GitHub now hides secrets, does Netlify? Should builds be restricted to only PRs by me and not forks to avoid someone making a preview that expposes a token? The easiest is just private logs.

```Makefile
export GITHUB_TOKEN := $(if $(GITHUB_TOKEN), $(GITHUB_TOKEN), '')

check-env:
	@echo Checking value of GITHUB_TOKEN...

	@echo "- Make-level with environment var: $$GITHUB_TOKEN"

	@echo "- Make-level with source:"
	@source .env && echo $$GITHUB_TOKEN

	@bash -c 'echo "- Subprocess-level: $$GITHUB_TOKEN"'

build:
	source .env && bundle exec jekyll build --trace
```
