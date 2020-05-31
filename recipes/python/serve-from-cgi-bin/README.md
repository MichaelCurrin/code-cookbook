# Serve from CGI bin


Place py file in cgi-bin or htbin folders

Make the file executable
```sh
$ chmod +x filename.py
```

Run CGI server

```sh
$ python -m CGIHTTPServer 
```

Open in the browser

- http://localhost:8000/cgi-bin/test.py

Or use:

```sh
python -m webbrowser -t "http://localhost:8000/cgi-bin/test.py"
```
