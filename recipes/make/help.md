---
description: Add a `help` target to your Makefile
---
# Help

The focus here is on the `help` target and some other targets are covered so you can see what kind of format is works against in that file.


## Samples

### Basic

Find lines starting with lowercase letters or comments. This excludes `.HOOKS` and any constants (typicall set using uppercase). This excludes empty lines, so the output is tightly packed.

- `Makefile`
	```mk
	h help:
		@grep ^[a-z#]' Makefile
	```

If you need to ignore an export like `export FOO := 'bar'` by requiring certain characters (lowercase letters, spaces or hyphens) repeated up to a colon and using extended `egrep`.

- `Makefile`
	```mk
	h help:
		@egrep '^[a-z -]+:' Makefile
	```

If you want non-indented comments as well, add this to the start: `^#|`.

This pattern does not care if there is anything after the colon.

Or maybe it is cleaner to ignore `export` rather.

### Not indented

Print lines that are not indented (targets and comments) or empty (so that empty lines add space between commands).

- `Makefile`
	```mk
	h help:
		@egrep '^\S|^$$' Makefile
	```

### Include echo lines

If you use `@echo` within your targets, you can incldue them.

Includes left-aligned, empty lines and echo lines.

- `Makefile`
	```mk
	help:
		@egrep '(^\S)|(^$$)|\s+@echo' Makefile
	```

### Detailed

Copied from Poetry's [Makefile](https://github.com/python-poetry/poetry/blob/master/Makefile).

This is complex - I don't know why. I haven't tested yet but maybe something here is useful.

- `Makefile`
	```makefile
	list:
		@sh -c "$(MAKE) -p no_targets__ | \
			awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {\
				split(\$$1,A,/ /);for(i in A)print A[i]\
			}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
	# required for list
	no_targets__:

	```

### Two column help

This will sort targets, split into two columns and add colors. It expects a description to come after the command with a double hash.

- `Makefile`
	```mk  
	help: ## Show the commands and help
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
            | sort \
            | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
            
    install: ## Install all dependencies
        # ...
	```

Sample output (the left column is colored blue).

```
help                           Show the commands and help
install                        Install all dependencies
```

### Some improvements on above

If you want to support an alias line instead of ignoring completely, then add a space in the `[]` regex piece.

```
s serve                        Start dev server
```

If you want to support targets _without_ comments, make `#` optional with `#?#?`. Or don't require them at all.

Result pattern:

```
'^[a-zA-Z_ -]+:'
```

### List targets and descriptions

- `Makefile`
	```mk
	help: ## List targets & descriptions
		@cat Makefile* \
            | grep -E '^[a-zA-Z_-]+:.*?## .*$$' \
            | sort \
            | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

	id: ## Output BUILD_ID being used
		@echo $(BUILD_ID)
	```
