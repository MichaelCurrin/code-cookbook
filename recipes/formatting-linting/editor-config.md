# EditorConfig

See [editorconfig.org](https://editorconfig.org/).

The point of the editor config file is to set one in each repo so that when you or others edit in the repo in any IDE that supports it, you'll get the same settings. Note VS Code needs an extension.

Note that VS Code does let you choose the indent level and tabs/spaces handling, but this is limited as it is not by file type but for all files, whether global or across a project.

TODO - Can I create one at the user level to share across all repos? Unless `root = true` is set.


## Samples

These are separate but can combined if they make sense for one project.

### Demo

Provided on the EditorConfig homepage.

```ini
# EditorConfig is awesome: https://EditorConfig.org

# top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true

# Matches multiple files with brace expansion notation
# Set default charset
[*.{js,py}]
charset = utf-8

# 4 space indentation
[*.py]
indent_style = space
indent_size = 4

# Tab indentation (no size specified)
[Makefile]
indent_style = tab

# Indentation override for all JS under lib directory
[lib/**.js]
indent_style = space
indent_size = 2

# Matches the exact files either package.json or .travis.yml
[{package.json,.travis.yml}]
indent_style = space
indent_size = 2
```

### Python

```ini
[*.py]
indent_style = space
indent_size = 4
```

### Make

```ini
[Makefile]
indent_style = tab
```

### JavaScript

```ini
indent_style = space
indent_size = 2
```
