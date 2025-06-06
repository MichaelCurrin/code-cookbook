# Passwords

Here `secrets.choice` is used for cryptographically strong random generation.

## One-liner for the shell

```sh
$ python -c "import secrets, string; print(''.join(secrets.choice(string.ascii_letters + string.digits + string.punctuation) for _ in range(20)))"
```

## Python script

```python
#!/usr/bin/env python3

import secrets
import string

DEFAULT_LENGTH = 20
CHAR_SET = string.ascii_letters + string.digits + string.punctuation

def create_password(length=DEFAULT_LENGTH, char_set=CHAR_SET):
  """
  Generate a secure, random password of a specified length and set of characters.
  """
  return ''.join(secrets.choice(char_set) for i in range(length))


if __name__ == "__main__":
  generated_password = create_password()
  print(generated_password)
```
