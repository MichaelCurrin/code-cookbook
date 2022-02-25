# Go

## Cross-platform build

Based on [goshell](https://github.com/markel1974/goshell/blob/main/Makefile).

Cleaning would be easier if there is an output directory.

```Makefile
SRC = main.go
OUTNAME = goshell
CC = go
CFLAGS = build

LIN32 = GOOS=linux GOARCH=amd64
LIN64 = GOOS=linux GOARCH=amd64
WIN32 = GOOS=windows GOARCH=386
WIN64 = GOOS=windows GOARCH=amd64
MAC32 = GOOS=darwin GOARCH=386
MAC64 = GOOS=darwin GOARCH=amd64

default: lin64

all: lin64 win32 win64 mac64


lin32: $(SRC)
	$(LIN32) $(CC) $(CFLAGS) -o $(OUTNAME)-linx386 $(SRC)

lin64: $(SRC)
	$(LIN64) $(CC) $(CFLAGS) -o $(OUTNAME)-linx64 $(SRC)

win32: $(SRC)
	$(WIN32) $(CC) $(CFLAGS) -o $(OUTNAME)-x386.exe $(SRC)

win64: $(SRC)
	$(WIN64) $(CC) $(CFLAGS) -o $(OUTNAME)-x64.exe $(SRC)

mac32: $(SRC)
	$(MAC32) $(CC) $(CFLAGS) -o $(OUTNAME)-mac386 $(SRC)

mac64: $(SRC)
	$(MAC64) $(CC) $(CFLAGS) -o $(OUTNAME)-macx64 $(SRC)

clean:
	rm $(OUTNAME).exe $(OUTNAME)-x64.exe $(OUTNAME)-x386.exe $(OUTNAME) $(OUTNAME)-x386 $(OUTNAME)-macx64 $(OUTNAME)-mac386
```
