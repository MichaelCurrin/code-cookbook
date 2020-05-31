#!/usr/bin/env python3
"""
CGI bin test script.
"""
response = """\
<!DOCTYPE html>
<html>

<body>
    <h2>Hello, world!</h2>

</body>

</html>
"""

print("Content-Type: text/html")
print("")
print(response)
