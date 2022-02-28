# Convert between file types

Convert input data as CSV, JSON or YAML and output as CSV, JSON or YAML.

_TODO_

- YAML support
- One tool/entrypoint to do everything as its own repo
- Formats could be recognized using the extensions.
- Work with stdin and stdout as a unix tool, rather than handling file IO internally.

## Related

- [Read and write files](https://michaelcurrin.github.io/dev-cheatsheets/cheatsheets/python/files-and-paths/read-and-write/) in Dev Cheatsheet


## CSV to JSON

- `main.py`
    ```python
    #!/usr/bin/env python3
    """
    Data type converter.

    Read data in data in CSV, JSON or YAML format, then output using desired type.

    Reading and writing a CSV only works with an array of dictionaries, to represent rows.
    The other types can use a dictionary instead at the top level.

    This tool is useful for example if you have a YAML or CSV file that you want to prepare as JSON file, 
    then you can serve it as a static JSON file so on an endpoint that acts as a read-only REST API.

    This can also be used as a reference or as a library for larger projects.

    Sample usage:

        >>> file_data = csv_in("in.csv")
        >>> json_out("out.json", file_data, True)
    """
    import csv
    import json

    JSON_INDENT_PRETTY = 2
    # Same as the default values, but without trailing spaces.
    JSON_SEPARATORS_MIN = (",", ":")


    def csv_in(path: str):
        """
        Read CSV file and return a list of dictionaries.
        """
        with open(path) as f_in:
            reader = csv.DictReader(f_in)

            data = list(reader)

        return data


    def json_out(path: str, data: str, pretty: bool):
        """
        Write JSON data to given file path.

        :param pretty: If true, indent code and separate over multiple lines.
            Defaults to false, for a compressed file.
        """
        if pretty:
            indent = JSON_INDENT_PRETTY
            separators = None
        else:
            indent = None
            separators = JSON_SEPARATORS_MIN

        with open(path, "w") as f_out:
            json.dump(data, f_out, indent=indent, separators=separators)

    ```

## JSON to CSV

- `main.py`
    ```python
    #!/usr/bin/env python3
    """ 
    Convert JSON to CSV.
    """
    import csv
    import json


    def json_in(path: str):
        """
        Read JSON file and return data.
        """
        with open(path) as f_in:
            json_data = json.load(f_in)

        return json_data


    def csv_out(path: str, out_data: str):
        """
        Write CSV data to given file path.
        """
        fieldnames = list(out_data[0].keys())

        with open(path, "w") as f_out:
            writer = csv.DictWriter(f_out, fieldnames)
            writer.writeheader()
            writer.writerows(out_data)


    def main():
        """
        Command-line entry-point.
        """
        json_data = json_in("response.json")

        out_data = json_data["products"]
        csv_out("out.csv", out_data)


    if __name__ == "__main__":
        main()
    ```

If you have any objects like a list or dict, they will be written out as stringified objects by the CSV writer.

If you need to get specific fields out of those objects, you can do this:

```python
def main():
    out_data = json_in("response.json")

    for x in out_data:
        # Get needed out of objects and add to row.
        abc = x["abc"]
        x["abcStartDate"] = abc["startDate"]

        # Delete unneeded objects.
        del x["abc"]
        del x["def"]

    csv_out("out.csv", out_data)
```

If performance was an issue, you could move that logic to a function and then make a list comprehension.
