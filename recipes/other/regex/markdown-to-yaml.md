# Markdown to YAML

Specifically dealing with links, here I convert links from Markdown to YAML, so that it can be stored as data in my [Dev Resources](https://michaelcurrin.github.io/dev-resources/) site.

{% raw %}

## How to run

The pattern works great in VS Code when doing _Find and Replace_, with _Regex_ enabled. Especially as you can easily preview or undo.

But you could also set this up to work with a CLI tool like `grep`.


## Convert

### Pattern

Find:

```re
(\s+)?- \[(.+)\]\((.+)\) ?(.+)?
```

Replace:


Notes:

- The spaces at the start are optional but are used to indent the output
- The space, dash and space and text at the end are optional.
- The groups are captured with brackets and then used in the output using dollar sign substitution.
- A limitation is that any lines without links such as headings or quotes are _not_ picked up, as the pattern becomes to complex (also one needs multi-line context to differniate between a bullet point as a heading or as comment under a point). But fortunately, those lines will remain **unaffected** and stay in the output, since we are replacing lines in existing content and not generating fresh output.
- You'll still need to to be a bit of clean-up, but this pattern does most of the repetitive work for you.

### Sample input

```markdown
- [ABC](https://abc.com)
- [DEF](https://def.com) with comment
- [GHI](https://ghi.com) - dash comment
- TypeScript
    - [Download](https://www.typescriptlang.org/download)
    - [TypeScript Cheatsheet](https://devhints.io/typescript) on DevHints.
- Docs
    - [Basic types](https://www.typescriptlang.org/docs/handbook/basic-types.html)
    - [Interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html) - type checking based on the _shape_ of the data.
        - [Extra level of indenting](https://example.com)
```

### Sample output

```yaml
- title: ABC
  url: https://abc.com
  description: 
- title: DEF
  url: https://def.com
  description: with comment
- title: GHI
  url: https://ghi.com
  description: - dash comment
- TypeScript
    - title: Download
      url: https://www.typescriptlang.org/download
      description: 
    - title: TypeScript Cheatsheet
      url: https://devhints.io/typescript
      description: on DevHints.
- Docs
    - title: Basic types
      url: https://www.typescriptlang.org/docs/handbook/basic-types.html
      description: 
    - title: Interfaces
      url: https://www.typescriptlang.org/docs/handbook/interfaces.html
      description: - type checking based on the _shape_ of the data.
        - title: Extra level of indenting
          url: https://example.com
          description: 
```


{% endraw %}
