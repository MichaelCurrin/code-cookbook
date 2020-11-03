# Help

Printing help for target commands.

The focus here is on the `help` target and some other targets are covered so you can see what kind of format is works against in that file.

## Samples

### Basic

My own.

- `Makefile`
	```mk
	# Show summary of make targets.
	help:
		@echo 'Print lines that are not indented (targets and comments) or empty.'
		@egrep '^\S|^$$' Makefile
	```

### Extended

If you use `@echo` within your targets:

My own.

- `Makefile`
	```mk
	# Show summary of make targets.
	help:
		@echo 'Print lines that are not indented (targets and comments) or empty, plus any indented echo lines.'
		@egrep '(^\S)|(^$$)|\s+@echo' Makefile
	```

Alt echo: `@echo "Include left-aligned, empty lines and echo lines."`

### Detailed

Copied from Poetry's [Makefile](https://github.com/python-poetry/poetry/blob/master/Makefile).

This is complex - I don't know why. I haven't tested yet but maybe something here is useful.

- `Makefile`
	```makefile
	# lists all available targets
	list:
		@sh -c "$(MAKE) -p no_targets__ | \
			awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {\
				split(\$$1,A,/ /);for(i in A)print A[i]\
			}' | grep -v '__\$$' | grep -v 'make\[1\]' | grep -v 'Makefile' | sort"
	# required for list
	no_targets__:

	```

### Sort and add colors

- `Makefile`
	```mk
	.PHONY: virtualenv
	virtualenv: $(PYTHON)
	$(PYTHON):
		$(VIRTUALENV) $(VENV)

	clean: ## Destroy the virtual environment
		rm -rf .venv

	help: ## Show the help indications
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	```


### List targets and descriptions

- `Makefile`
	```mk
	help: ## List targets & descriptions
		@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

	id: ## Output BUILD_ID being used
		@echo $(BUILD_ID)
	```
