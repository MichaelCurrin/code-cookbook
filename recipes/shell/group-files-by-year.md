# Group files by year

Given Markdown files with date in title, move them into subfolders using the year.

e.g. `2019-02-03.md` -> `2019/2019-02-03.md`

```sh
#!/bin/bash

set -e

for FILE in *.md; do
    [ -e "$FILE" ] || continue
    FOLDER_NAME=$(echo "$FILE" | cut -c 1-4)
    mkdir -p "$FOLDER_NAME"
    mv "$FILE" "$FOLDER_NAME/"
done
```

Note the check at the start because in Bash (not ZSH), if `*.md` does not match any files then it uses `'*.md'` as a string literal.
