# Tags

## Get latest tag

Get the most recent tag, whether on the current tag or not.

```sh
LAST_TAG=$(git describe --abbrev=0 --tags 2>/dev/null)
```


## Check for tag at current commit

### Short

If the given commit reference does _not_ have a tag on it, then this will give an error status.

```sh
git describe --exact-match HEAD
```

Here handling the status.

```sh
git describe --exact-match --tags HEAD &> /dev/null \
  && echo 'Commit is tagged' || \
  echo 'Commit is NOT tagged'
Commit is tagged
```

Note use of `>` will handles stdout, for the tag on a success. Otherwise you'd get:

```
v1.0.2
Commit is tagged
```

And `&>` handles stderr too, to handle the error message on not tag. Without it, you'd get:

```
fatal: no tag exactly matches '9641372537f8025591b8808c6f9194f211062394'
Commit is NOT tagged
```

### Detailed

```sh
LAST_TAG=$(git describe --abbrev=0 --tags 2>/dev/null)

if [[ -n "$LAST_TAG" ]]; then
  BRANCH_HASH=$(git rev-parse HEAD)
  LAST_TAG_HASH=$(git rev-parse $LAST_TAG)

  if [[ "$BRANCH_HASH" == "$LAST_TAG_HASH" ]]; then
    echo "Current commit has a tag"
  fi
fi
```
