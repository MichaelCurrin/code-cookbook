# IDE settings

Create VS Code config:

```json
{
    "files.associations": {
        // Use "Jekyll (HTML)" so that Jekyll Liquid syntax is picked up correctly for validation and highlighting.
        "*.html": "jekyll",
        "*.md": "jekyll",
        // Revert the above rule for a doc file.
        "README.md": "markdown",
    },
}
```
