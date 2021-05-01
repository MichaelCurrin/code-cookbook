# GitHub Action - Markdown link check

[GitHub Marketplace](https://github.com/marketplace/actions/markdown-link-check)


## Sample

- `check-links.yml`
    ```yaml
    name: Check Markdown links

    on: push

    jobs:
      check-links:
        runs-on: ubuntu-latest
        
        steps:
        - name: Checkout 
          uses: actions/checkout@master
          
        - name: Check Markdown links
          uses: gaurav-nelson/github-action-markdown-link-check@v1
    ```

Example of configured use:

```yaml
steps:
  - name: Check Markdown links
    uses: gaurav-nelson/github-action-markdown-link-check@v1
    with:
      use-quiet-mode: 'yes'
      use-verbose-mode: 'yes'
      config-file: 'mlc_config.json'
      folder-path: 'docs/markdown_files'
      max-depth: 2
```
