# Requests

## Get URLs on a page

Request using `requests` Parse the response with `BeautifulSoup` package.

```sh
$ pip install requests BeautifulSoup
```

- `main.py`
    ```python
    import sys

    import requests
    from bs4 import BeautifulSoup


    OUT_PATH = "links.txt"


    def get_links(url):
        resp = requests.get(url)
        soup = BeautifulSoup(data.text, "html.parser")

        return [link.get("href") for link in soup.find_all("a")]


    def main(args):
        """
        Main command-line entry-point.
        """
        if not args:
            print(f"Usage: python {__name__} URL")

            return

        url = args[0]
        if not url.startswith("http"):
            url = f"https://{url}"

        print(f"Requesting: {url}")
        links = get_links(url)

        print(f"Writing to ${OUT_PATH}")
        with open(OUT_PATH, "w") as f_out:
            f_out.write(links)


    if __name__ == "__main__":
        main(sys.argv[1:]
    ```

Sample usage:

```sh
$ python3 main.py example.com
$ python3 main.py https://example.com
```
