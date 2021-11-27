# Open files

## Compare `io.open` and `open`

Open files - io.open vs open

For python 2.7 - `io.open` and file built-in `open` are not equivalent.

Open has two encoding modes - text (str) and binary. If you give it a unicode string to write out in binary mode, you get a binary file which cannot be opened in a text editor, but giving it str in binary mode still produces readable text file.

Note that no encoding mode has been set for io.open here and open does not have encoding parameter.

See https://mail.python.org/pipermail/python-list/2015-March/687124.html

### Setup
    
```python
u = u'abc\ndef'
s = 'abc\ndef'
```

### Using builtin `open`

```python
# Write str in text mode.
with open('builtin_test_s.txt', 'w') as f:
    f.writelines(s)
    # Get text.
    # abc
    # def


# Write str in binary mode.
with open('builtin_test_s_b.txt', 'wb') as f:
    f.writelines(s)
    # Get text.

# Write unicode in binary mode.
with open('builtin_test_u_b.txt', 'wb') as f:
    f.writelines(u)
    # Get binary file.
    # 6100 0000 6200 0000 6300 0000 0a00 0000
    # 6400 0000 6500 0000 6600 0000


### Using `io.open`

```python
import io

# Write unicode string in text mode.
with io.open('io_test_u.txt', 'w') as f:
    f.writelines(u)
    # Get text.

# Write unicode string in binary mode.
# This can then be viewed easily in a text editor.
with io.open('io_test_u_b.txt', 'wb') as f:
    f.writelines(u)
    # Get text.


# Not allowed to write str in text mode.
try:
    with io.open('io_test_s.txt', 'w') as f:
        f.writelines(s)
        # Get error.
except TypeError as e:
    print type(e).__name__, e
    # write() argument 1 must be unicode, not str

# Allowed to write str in binary mode.
with io.open('io_test_s_b.txt', 'wb') as f:
    f.writelines(s)
```

### Implications

Binary mode is preferred for writing text files because of how newline
characters are handled platform indepedent.

However, if you have a unicode string to write out in binary mode ('wb'),
if you write with `io.open` you get a viewable encoded text file but if
you use builtin `open` you get a binary file which cannot be viewed in a text
editor.

If you have a `str` string to write out in binary mode, then `io.open`
will give you a viewable text file (will fail if you write `str` without
binary mode) and builtin `open` will also be fine.
