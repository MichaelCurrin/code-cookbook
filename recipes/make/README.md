# Make cookbook


## Defaults

Set defaults.

`defaults.mk`

```
FOO=${FIZZ}
BAR=${BUZZ}

export
```

Import defaults.


```mk
include defaults.mk
```


## Conditional


Using `@if`. This can be used as a check used in other commands.

```
foo:
	@echo "Exporting environment";
	@export ENVIRONTMENT=prod;
	@if [ -z $(FOO) ]; then \
		echo "FOOOOO must be set; export FOO=<foo>"; exit 10;
	fi
```


Using `ifneq`.

```
foo:
ifneq ($(wildcard ./fizz/$(BUZZ)),)
	$(eval NAME=$(shell sh -c "grep ..."))
endif
  ...
```
