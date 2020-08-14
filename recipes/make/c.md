# C with make

- `Makefile`
    ```mk
    helloword: helloword.c
        gcc -o hellword hellword.c -I.
    ```

Then run:

```sh
$ make helloword
```


Here is an example of a typical C project Makefile, copied from this[article](https://opensource.com/article/18/8/what-how-makefile).


- `Makefile`
    ```make
    # Usage:
    # make        # compile all binary
    # make clean  # remove ALL binaries and objects

    .PHONY = all clean

    CC = gcc                        # compiler to use

    LINKERFLAG = -lm

    SRCS := foo.c
    BINS := foo

    all: foo

    foo: foo.o
            @echo "Checking.."
            gcc -lm foo.o -o foo

    foo.o: foo.c
            @echo "Creating object.."
            gcc -c foo.c

    clean:
            @echo "Cleaning up..."
            rm -rvf foo.o foo
