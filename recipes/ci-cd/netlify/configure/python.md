# Python


## Configure a new Python version

The default is Python 2.7.

Switch to Python 3 by doing the following.

### Change image

Based on [answer](https://answers.netlify.com/t/python-3-8-and-ignore-pipfile/15063/11).

1. Go to Deploy Settings
1. Go to Build Image Selection
1. Choose Ubuntu Focal 20, rather than the standard Ubuntu Xenial 18.

### Set Python version.

Do any one of these to set `3.8`. Or a newer version.

- Create `runtime.txt` in your repo root with `3.8` and no other text in it.
- Set `PYTHON_VERSION` as `3.8` in environment variables.
    - The easiest is to do this on Netlify.
    - You can also do this in `netlify.toml` under `environment` field, but you also need to enable something in Netlify settings to allow environment variables to be used.
- Set a Python version of `3.8` in your `Pipfile` if you use that instead of `requirements.txt`.
 
Then when you build your site, you'll see output like:

```
3:18:05 PM: Python version set to 3.8
```
