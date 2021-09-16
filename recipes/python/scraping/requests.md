# Requests

## Get URLs on a page

Request using [requests](https://docs.python-requests.org/en/latest/) and parse the response with [BeautifulSoup4](https://beautiful-soup-4.readthedocs.io/en/latest/) package.

Install packages:

```sh
$ pip install requests BeautifulSoup4
```

Script to run:

- `main.py`
    ```python
    """
    Get all links on page.
    """
    import sys

    import requests
    from bs4 import BeautifulSoup

    OUT_PATH = "links.txt"


    def get_links(url):
        resp = requests.get(url)
        soup = BeautifulSoup(resp.text, "html.parser")

        return [link.get("href") for link in soup.find_all("a")]


    def main(args):
        """
        Main command-line entry-point.
        """
        if not args:
            print(f"Usage: python {sys.argv[0]} URL")

            return

        url = args[0]
        if not url.startswith("http"):
            url = f"https://{url}"

        print(f"Requesting: {url}")
        links = get_links(url)

        print(f"Writing to {OUT_PATH}")
        with open(OUT_PATH, "w") as f_out:
            content = "\n".join(links)
            f_out.write(content)


    if __name__ == "__main__":
        main(sys.argv[1:])

    ```

Sample usage:

```sh
$ python3 main.py example.com
$ python3 main.py https://example.com
```

Sample output:

- `links.txt`
    ```
    https://www.iana.org/domains/example
    ```
    
