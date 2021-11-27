# Python

Maybe you want to use [MkDocs][] or a similar Python package to build a site or a docs site. Or maybe you want to use Python to get API or database data as a JSON file, before building your site with Jekyll, Node, or whatever.

[MkDocs]: https://github.com/MichaelCurrin/mkdocs-quickstart


## Use Python

Set a Python script to be in your `netlify.toml` file's `build` command.

e.g.

```toml
[build]
  command = "python hello.py"
  publish = "build"
```

Or with MkDocs:

```toml
[build]
  command = "mkdocs build --strict"
  publish = "site"
```

I prefer to use a `Makefile`, so I can always run the same command locally and on Netlify.

```toml
[build]
  command = "make build"
  publish = "site"
```


## Configure a new Python version

The default is Python 2.7.

Switch to Python 3 by doing the following.

### 1. Change image

Based on [answer](https://answers.netlify.com/t/python-3-8-and-ignore-pipfile/15063/11).

1. Go to Deploy Settings
1. Go to Build Image Selection
1. Choose Ubuntu Focal 20, rather than the standard Ubuntu Xenial 18.

### 2. Set Python version

Do any one of these approaches to get Python 3.8. I tried with `3.9` but got an error.

- Create `runtime.txt` in your repo root with `3.8` and no other text in it.
- Set `PYTHON_VERSION` as `3.8` in environment variables.
    - The easiest is to do this on Netlify.
    - You can also do this in `netlify.toml` under `environment` field, but you also need to enable something in Netlify settings to allow environment variables to be used.
- Set a Python version of `3.8` in your `Pipfile` if you use that instead of `requirements.txt`.
 
### Deploy site

When you build your site, you'll see output like, based on teh 

```
3:18:05 PM: Python version set to 3.8
```
