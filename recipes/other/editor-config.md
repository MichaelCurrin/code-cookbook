---
description: How to setup a `.editorconfig` file for your project
---
# EditorConfig


## Resources

See [editorconfig.org](https://editorconfig.org/) homepage for info on what the file is, how use wildcard patterns and what properties are supported.

See also the [EditorConfig Properties](https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties) on the Wiki.


## About

What is EditorConfig?

> EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs. The EditorConfig project consists of a file format for defining coding styles and a collection of text editor plugins that enable editors to read the file format and adhere to defined styles. EditorConfig files are easily readable and they work nicely with version control systems.

The point of the editor config file is to set one in each repo so that when you or others edit in the repo in any coding environment that supports it, you'll get the same settings.

Note that this config intended to be a versioned file read by IDEs - I don't think command-line tools use it and I don't know if Vim or Nano etc. support it.


## IDE support

The `.editorconfig` file will actually only be used by your IDE if it supports it.

GitHub and PyCharm don't need an extension to support this.

And for VS Code, you need an extension. I would highly recommend the [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) extension as it is popular and I find it useful.

You can even use that extension to generate config for you. Open the VS Code command prompt and run the _Generate .editorconfig_ command, or right-click in your root directory and select the option from the droplist.

### VS Code notes

Without using editor config, VS Code already lets you choose the indent level and tabs/spaces handling. You cannot set by file type though. It can infer from the current file, this can be annoying when creating a new JS file example and the indent level is set to 4 spaces until you override it or type it that way.

When you use an editor config file and an extension in VS Code, then you get to set the indentation for all new and existing files. This takes preference over the VS Code's inference.

For using the Prettier extension, see the VS Code section of the [Prettier]({{ site.baseurl }}{% link recipes/javascript/format-and-lint/prettier.md %}) page.


## File format

Here is what the general syntax is like for a `.editorconfig` file.

```ini
root = true

[*]
foo = bar

[*.foo]
# ...

[*.{buzz,bazz}]
# ...

[lib/**.js]
# ...

[{*.gql,Makefile}]
# ...
```

Some like to put this at the top of the file before `root`.

```ini
# editorconfig.org
```


## Samples

Pick from some of these sample files and add as `.editorconfig` in your project. Some are smaller pieces that can be combined as you mix languages.

### Own

I find this a good starting point for adding a file to a project and then refining it.

#### Focus on 4-spaces

If most of your file types use 4-spaces, use this.

```ini
root = true

[*]
indent_style = space
indent_size = 4

[*.{js,json}]
indent_size = 2

[Makefile]
indent_style = tab
```

If your 2-space block below starts growing, consider using the section covered next.

#### Focus on 2-spaces

Even if most of the files by count use 4 spaces, if  most of your file types use 2 spaces then use this.

This handles shell, JS, Ruby, CSS, config files, etc. without setting them explicitly.

```ini
root = true

[*]
indent_style = space
indent_size = 2

[*.{html,md}]
indent_size = 4

[Makefile]
indent_style = tab
indent_size = 4
```

The Makefile part is clearer on its own.

Set the line length to `80` or `100` as you prefer. I can't see the difference in JS files. But I can see an HTML file wrapping differently as I change this to short values like `10`.

```ini
max_line_length = 80
```

#### Shared projects

If you have other people contributing your project with a different choice of IDE, IDE configuration or OS, then you may want to extend these settings to include this:

```ini
[*]
# ...
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
```

### Python

```ini
[*.py]
indent_style = space
indent_size = 4
```

Optionally set the size. Though, PyLint CLI, the VS Code extensions and VS Code settings handle this fine without setting this.

```
max_line_length = 80
```


### Two spaces

If needed, also add this to the samples below.

```ini
indent_style = space
```

### Configs

```ini
[*.{json,yml}]
indent_size = 2
```

#### Shell

```ini
[*.sh]
indent_size = 2
```

#### JavaScript

```ini
[*.js]
indent_size = 2
```

```ini
[*.{js,ts}]
indent_size = 2
```

```ini
[*.{js,json}]
indent_size = 2
```

#### Ruby

```ini
[*.rb]
indent_size = 2
```

### Tabs

#### Make

Without EditorConfig settings, VS Code knows that a `Makefile` must have tabs only (running a file with spaces gives an error).

But, if you use a `*` glob change it in your EditorConfig, then also need a section `Makefile`. The size is just for visibility in the IDE, not how it is stored.

```ini
[Makefile]
indent_style = tab
indent_size = 4
```

See section at the start of this page on mixing `Makefile` with other extensions.

#### GraphQL

```ini
[*.gql]
indent_style = tab
indent_size = 4
```

### Markdown

```ini
[*.md]
indent_style = space
indent_size = 4
```

### HTML

```ini
[*]
charset = utf-8
indent_size = 4
indent_style = space
insert_final_newline = true
trim_trailing_whitespace = true
```

For Jekyll markdown support, you could add this. But only if you use the double space at the end of a line to signify a line break.

```ini
[*.md]
trim_trailing_whitespace = false
```

### Jekyll

For a Jekyll project.

Using HTML, Markdown, JSON, YAML, JS, Ruby, CSS, SCSS and Makefile. Only the first two are actually 4 spaces, so a glob for 2 spaces makes sense.

```ini
root = true

[*]
indent_style = space
indent_size = 2

[*.{md,html}]
indent_size = 4

[Makefile]
indent_style = tab
indent_size = 4
```

### Generated

The VS Code EditorConfig extension can generate a file for you if you right-click on a file on a folder. It won't create one if one already exists. You could also create them them at multiple levels if you need to.

Here is output generated by the extension. Perhaps too verbose. Also I had to tweak the whitespace ones as below and VS Code does not honor those - it has its own IDE settings.

```ini
root = true

[*]
indent_style = space
indent_size = 4
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
```

### Generic

Some devs like to set this before going into more formats. I don't see it as needed. The final newline I handle in my global IDE settings, though other users might not.

```ini
[*]
charset = utf-8
insert_final_newline = true
```

### Demo

Based on the sample on the EditorConfig homepage.

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
