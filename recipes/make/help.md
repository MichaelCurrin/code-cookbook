# Help

Printing help for target commands.


## Samples

Sort and add colors.

```make
.PHONY: virtualenv
virtualenv: $(PYTHON)
$(PYTHON):
	$(VIRTUALENV) $(VENV)

.PHONY: clean
clean: ## Destroy the virtual environment
	rm -rf .venv

.PHONY: help
help: ## Show the help indications
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
```
