# Help

Printing help for target commands.

The focus here is on the `help` target and some other targets are covered so you can see what kind of format is works against in that file.

## Samples

Sort and add colors.

- `Makefile`
	```make
	.PHONY: virtualenv
	virtualenv: $(PYTHON)
	$(PYTHON):
		$(VIRTUALENV) $(VENV)

	clean: ## Destroy the virtual environment
		rm -rf .venv

	help: ## Show the help indications
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	```


List targets and descriptions.

- `Makefile`
	```mk
	help: ## List targets & descriptions
		@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

	id: ## Output BUILD_ID being used
		@echo $(BUILD_ID)
	```
