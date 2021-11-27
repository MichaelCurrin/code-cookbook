# Basic

- `Makefile`
    ```make
    say_hello:
        echo "Hello World"
    ```

Run it:

```sh
$ make
echo "Hello World"
Hello World
```

Use `@echo` to avoid printing the echo line before it is run.

Note that commands are also printed, so using a mix between `#` comments and `@echo` statements can help describe your flow when reading the `Makefile` and executing it.
