# Serve from CGI bin

Based on [StackOverflow](http://stackoverflow.com/questions/10396330/how-to-host-python-cgi-script-with-python-m-simplehttpserver-8000-or-python).

Place `.py` file in `cgi-bin` or `htbin` folder.

Make the file executable.

```sh
$ chmod +x filename.py
```

Run CGI server

```sh
$ python -m CGIHTTPServer 
```

Open in the browser:

- http://localhost:8000/cgi-bin/test.py

Or use:

```sh
$ python -m webbrowser -t "http://localhost:8000/cgi-bin/test.py"
```
