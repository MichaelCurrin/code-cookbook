# Dotenv

How to load `.env` in Bash.


Given file `.env`:

```sh
FOO=bar
BIZ=buzz
```

Load into current process. Note this is not available to subshells.

```sh
source .env
```

Or load it in the current process and export for subshells.

```sh
export $(<.env | xargs)
```

Use `cat .env` instead of `<.env` if you prefer.

If the file is optional:

```sh
if [ ! -f .env ]; then
  export $(cat .env | xargs)
fi
```

Check the value after running any approach above:

```sh
echo $FOO
```

We use `xargs` above as it splits the multiple lines in the file as separate experts.

Here is how it looks as a simpler view. Printing without and with quotes.

```sh
$ x=$(<.env) 

$ echo $x
FOO=bar BIZ=buzz

$ echo "$x"
FOO=bar 
BIZ=buzz
```

If your dotenv file has comment lines in it, then `source .env` will be okay but `export` won't.

So here we remove comment lines.

```sh
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi
```
