# Make cookbook


## Code blocks

Highlight with `mk`, `make`, or `makefile`/`Makefile`.


## Defaults

Set defaults.

`defaults.mk`

```mk
FOO=${FIZZ}
BAR=${BUZZ}

export
```

Import defaults.

```make
include defaults.mk
```


## Conditional


Using `@if`. This can be used as a check used in other commands.

```mk
foo:
	@echo "Exporting environment";
	@export ENVIRONTMENT=prod;
	@if [ -z $(FOO) ]; then \
		echo "FOOOOO must be set; export FOO=<foo>"; exit 10;
	fi
```


Using `ifneq`.

```makefile
foo:
ifneq ($(wildcard ./fizz/$(BUZZ)),)
	$(eval NAME=$(shell sh -c "grep ..."))
endif
  ...
```


## Call another target

Run `foo` first _first_ whenever `make bar` is run.

```makefile
foo:
	echo 'Foo'
	
bar: foo	
	echo 'Bar'
```

Run `bar` within `foo`:

```Makefile
foo:
	echo 'Foo'

bar:
	echo 'Bar'
	@$(MAKE) foo
```
