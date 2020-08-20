# Exports
> Exporting variables in Makefiles

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
