---
description: How to apply syntax highlighting and formatting to SCSS files in a Jekyll project
---
# Formatting


## Problem

There are a few SCSS formatters for VS Code.

You can let VS Code recognize `.scss` files as SCSS type.

Unfortunately if you use Beautify or Prettier with that, they collapse frontmatter dashes to a single like which is not valid.

And if you choose CSS or Jekyll as the type, you can't get syntax highlighting properly.


## SCSS Formatter

So I recommend this extension:

- [SCSS Formatter](https://marketplace.visualstudio.com/items?itemName=sibiraj-s.vscode-scss-formatter)

Install it and set is as the default formatter for SCSS files.

It respects frontmatter when formatting (it doesn't understand `#` comments properly though) and highlights the rest of the file as SCSS.

Unfortunately the linter gives a warning when the file starts with frontmatter dashes and not an `@` import.


## Alternatives

Keep searching here:

- [CSS, SCSS and Less](https://code.visualstudio.com/docs/languages/css)
