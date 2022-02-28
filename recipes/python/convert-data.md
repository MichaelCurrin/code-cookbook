# Convert between file types

Convert input data as CSV, JSON or YAML and output as CSV, JSON or YAML.

Here is a partially implemented solution.


_TODO: formats could be recognized using the extensions._

_TODO: This tool can be adapted to work with stdin and stdout as a unix tool, rather than handling file IO internally._


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
