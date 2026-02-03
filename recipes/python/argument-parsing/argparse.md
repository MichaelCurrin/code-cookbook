# Argparse


## Handle integers

- `main.py`
    ```python
    import argparse


    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('integers', metavar='N', type=int, nargs='+',
                        help='an integer for the accumulator')
    parser.add_argument('--sum', dest='accumulate', action='store_const',
                        const=sum, default=max,
                        help='sum the integers (default: find the max)')

    args = parser.parse_args()
    print(args.accumulate(args.integers))
    ```
  

## Handle passwords and API keys

Setting `nargs='?'` means the value is optional. Setting `const=True` triggers if `-p` is present but no value is provided.
    
```python
import argparse
import getpass


def main():
    parser = argparse.ArgumentParser(description="CLI with Secure Password Input")

    parser.add_argument(
        '-p', '--password', 
        nargs='?', 
        const=True, 
        help="Password for authentication (leave blank to be prompted)"
    )

    args = parser.parse_args()

    password = args.password

    if password is True:
        # Flag was used but no password provided: -p
        password = getpass.getpass("Enter Password: ")
    elif password is None:
        # Flag was not used at all
        print("No password provided. Proceeding as guest...")
    else:
        # Password was provided directly: -pMY_PASSWORD
        print("Warning: Providing password in CLI is insecure!")

    print(f"Password set to: {'*' * len(password)}")

if __name__ == "__main__":
    main()
```


## Subparsers

For multiple sub-commands to keep the arguments separate.


```python
import argparse


parser = argparse.ArgumentParser(description="Tool Manager")
subparsers = parser.add_subparsers(dest="command", help="Available commands")

greet_parser = subparsers.add_parser("greet", help="Say hello")
greet_parser.add_argument("--name", default="User")

# 3. Add a 'calc' sub-command (with totally different arguments)
calc_parser = subparsers.add_parser("calc", help="Add numbers")
calc_parser.add_argument("x", type=int)
calc_parser.add_argument("y", type=int)

args = parser.parse_args()
```

Sample usage:

```sh
# Main help menu.
python script.py --help

# Help specific to the 'greet' sub-command.
python script.py greet --help

# Run the 'greet' sub-command.
python script.py greet --name Alice

# Help specific to the 'calc' sub-command.
python script.py calc --help

# Run the 'calc' sub-command.
python script.py calc 10 5
```
