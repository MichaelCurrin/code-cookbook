---
---
# Serve from CGI bin

See [cgi](https://docs.python.org/3.8/library/cgi.html?highlight=cgi#module-cgi) in the Python 3 docs.

Place `.py` file in `cgi-bin` or `htbin` folder.

Make the file executable.

```sh
$ chmod +x filename.py
```

Run CGI server

```sh
$ python3 -m http.server
```

Open in the browser:

- http://localhost:8000/cgi-bin/test.py

Or use:

```sh
$ python3 -m webbrowser -t "http://localhost:8000/cgi-bin/test.py"
```
